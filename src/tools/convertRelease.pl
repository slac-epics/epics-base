#!/usr/bin/env perl
#*************************************************************************
# Copyright (c) 2008 UChicago Argonne LLC, as Operator of Argonne
#     National Laboratory.
# Copyright (c) 2002 The Regents of the University of California, as
#     Operator of Los Alamos National Laboratory.
# EPICS BASE is distributed subject to a Software License Agreement found
# in file LICENSE that is included with this distribution.
#*************************************************************************
#
# Convert configure/RELEASE file(s) into something else.
#

use strict;
use warnings;

use Cwd qw(cwd);
use Getopt::Std;
$Getopt::Std::STANDARD_HELP_VERSION = 1;

use FindBin qw($Bin);
use lib ("$Bin/../../lib/perl");

use EPICS::Path;
use EPICS::Release;

our ($arch, $top, $iocroot, $root);
our ($opt_a, $opt_d, $opt_t, $opt_T);

getopts('a:dt:T:') or HELP_MESSAGE();

my $cwd = UnixPath(cwd());

if ($opt_a) {
    $arch = $opt_a;
} else {                # Look for O.<arch> in current path
    $cwd =~ m{ / O. ([\w-]+) $}x;
    $arch = $1;
}

if ($opt_T) {
    $top = $opt_T;
} else {                # Find $top from current path
    # This approach only works inside iocBoot/* and configure/*
    $top = $cwd;
    $top =~ s{ / cpuBoot .* $}{}x;
    $top =~ s{ / iocBoot .* $}{}x;
    $top =~ s{ / configure .* $}{}x;
}

# The IOC may need a different path to get to $top
if ($opt_t) {
    $iocroot = $opt_t;
    $root = $top;
    if ($iocroot eq $root) {
        # Identical paths, -t not needed
        undef $opt_t;
    } else {
        while (substr($iocroot, -1, 1) eq substr($root, -1, 1)) {
            chop $iocroot;
            chop $root;
        }
        if ( $opt_d ) {
                print "-t option enabled: substituting $iocroot for $root in paths.\n";
        }
    }
}

HELP_MESSAGE() unless @ARGV == 1;

my $outfile = $ARGV[0];

# TOP refers to this application
my %macros = (TOP => LocalPath($top));
my @apps   = ('TOP');   # Records the order of definitions in RELEASE file

$ENV{MAKEFLAGS} = "";

# Read the RELEASE file(s)
my $relfile = "$top/configure/RELEASE";
die "convertRelease.pl can't find $relfile\n" unless (-f $relfile);
readReleaseFiles($relfile, \%macros, \@apps, $arch);
printMacros( 'macros from readReleaseFiles', \%macros ) if $opt_d;
expandRelease(\%macros);
printMacros( "macros after expandRelease", \%macros ) if $opt_d;

my @cfgVars = ('TOP');   # Records the order of definitions in configuration files
my %cfgMacros = (TOP => LocalPath($top));
$cfgMacros{'INSTALL_LOCATION'} = LocalPath($top);
if ( $outfile eq "cpuEnv.sh" )
{
	# Read cfgMacros and cfgVars from the CONFIG_SITE file(s)
	if ( defined $arch ) {
		$cfgMacros{'T_A'} = $arch;
	}
	my $rsfile = "$top/RELEASE_SITE";
	readReleaseFiles($rsfile, \%cfgMacros, \@cfgVars, $arch);

    my $cfgfile = "$top/configure/CONFIG_SITE";
    readReleaseFiles($cfgfile, \%cfgMacros, \@cfgVars, $arch);
    $cfgfile = "$top/configure/CONFIG_SITE.$ENV{EPICS_HOST_ARCH}.Common";
    readReleaseFiles($cfgfile, \%cfgMacros, \@cfgVars, $arch);
	if ( defined $arch )
	{
		$cfgfile = "$top/configure/CONFIG_SITE.Common.$arch";
		readReleaseFiles($cfgfile, \%cfgMacros, \@cfgVars, $arch);
    	$cfgfile = "$top/configure/CONFIG_SITE.$ENV{EPICS_HOST_ARCH}.$arch";
		readReleaseFiles($cfgfile, \%cfgMacros, \@cfgVars, $arch);
	}
	expandRelease(\%cfgMacros);
}

# This is a perl switch statement:
for ($outfile) {
    m/releaseTops/       and do { releaseTops();         last; };
    m/dllPath\.bat/      and do { dllPath();             last; };
    m/relPaths\.sh/      and do { relPaths();            last; };
    m/ModuleDirs\.pm/    and do { moduleDirs();          last; };
    m/cdCommands/        and do { cdCommands();          last; };
    m/envPaths/          and do { envPaths();            last; };
    m/cpuEnv\.sh/        and do { cpuEnv();              last; };
    m/checkRelease/      and do { checkRelease();        last; };
    die "Output file type \'$outfile\' not supported";
}


############### Subroutines only below here ###############

sub HELP_MESSAGE {
    print STDERR <<EOF;
Usage: convertRelease.pl [-a arch] [-d] [-T top] [-t ioctop] outfile
    -a can be used to specify the architecture, defaults to O.<arch> in current dir
    -d enables diagnostic output
    -T can be used to specify \$TOP
    -t can be used if IOC has a different \$TOP
    where outfile is one of:
        releaseTops - lists the module names defined in RELEASE*s
        dllPath.bat - path changes for cmd.exe to find Windows DLLs
        relPaths.sh - path changes for bash to add RELEASE bin dir's
        *ModuleDirs.pm - generate a perl module adding lib/perl paths
        cdCommands - generate cd path strings for vxWorks IOCs
        envPaths - generate epicsEnvSet commands for other IOCs
        cpuEnv.sh - generate bash shell env variable setup script for CPUs
        checkRelease - checks consistency with support modules
	default TOP is current dir w/ iocBoot/* or configure/* stripped off
EOF
    exit 2;
}

#
# List the module names defined in RELEASE* files
#
sub releaseTops {
    my @includes = grep !m/^ (TOP | TEMPLATE_TOP) $/x, @apps;
    print join(' ', @includes), "\n";
}

#
# Generate Path files so Windows/Cygwin can find our DLLs
#
sub dllPath {
    unlink $outfile;
    open(OUT, ">$outfile") or die "$! creating $outfile";
    print OUT "\@ECHO OFF\n";
    # This SET syntax is essential for supporting embedded spaces and '&'
    # characters in both the PATH variable and the new directory components
    print OUT "SET \"PATH=", join(';', binDirs(), '%PATH%'), "\"\n";
    close OUT;
}

sub relPaths {
    unlink $outfile;
    open(OUT, ">$outfile") or die "$! creating $outfile";
    print OUT "export PATH=\"", join(':', binDirs(), '$PATH'), "\"\n";
    close OUT;
}

sub binDirs {
    die "Architecture not set (use -a option)\n" unless ($arch);
    my @includes = grep !m/^ (RULES | TEMPLATE_TOP) $/x, @apps;
    my @path;
    foreach my $app (@includes) {
        my $path = $macros{$app} . "/bin/$arch";
        next unless -d $path;
        $path =~ s/^$root/$iocroot/o if ($opt_t);
        push @path, LocalPath($path);
    }
    return @path;
}

sub moduleDirs {
    my @deps = grep !m/^ (TOP | RULES | TEMPLATE_TOP) $/x, @apps;
    my @dirs = grep {-d $_}
        map { AbsPath("$macros{$_}/lib/perl") } @deps;
    unlink $outfile;
    open(OUT, ">$outfile") or die "$! creating $outfile";
    print OUT "# This is a generated file, do not edit!\n\n",
        "use lib qw(\n",
        map { "    $_\n"; } @dirs;
    print OUT ");\n\n1;\n";
    close OUT;
}

#
# Generate cdCommands file with cd path strings for vxWorks IOCs and
# RTEMS IOCs using CEXP (need parentheses around command arguments).
#
sub cdCommands {
    die "Architecture not set (use -a option)" unless ($arch);
    my @includes = grep !m/^(RULES | TEMPLATE_TOP)$/x, @apps;

    unlink($outfile);
    open(OUT,">$outfile") or die "$! creating $outfile";

    my $startup = $cwd;
    $startup =~ s/^$root/$iocroot/o if ($opt_t);
    $startup =~ s/([\\"])/\\$1/g; # escape back-slashes and double-quotes

    print OUT "startup = \"$startup\"\n";

    my $ioc = $cwd;
    $ioc =~ s/^.*\///;  # iocname is last component of directory name

    print OUT "putenv(\"IOC=$ioc\")\n";

    foreach my $app (@includes) {
        my $iocpath = my $path = $macros{$app};
        $iocpath =~ s/^$root/$iocroot/o if ($opt_t);
        $iocpath =~ s/([\\"])/\\$1/g; # escape back-slashes and double-quotes
        my $app_lc = lc($app);
        print OUT "$app_lc = \"$iocpath\"\n"
            if (-d $path);
        print OUT "putenv(\"$app=$iocpath\")\n"
            if (-d $path);
        print OUT "${app_lc}bin = \"$iocpath/bin/$arch\"\n"
            if (-d "$path/bin/$arch");
    }
    close OUT;
}

#
# Generate cpuEnv.sh file which sets env variables for bash shells.
# Used by RULES.cpu to set environment variables for the directory
# paths defined by macros in these 3 files, if they exist:
# 	$(TOP)/RELEASE_SITE
# 	$(TOP)/configure/CONFIG_SITE
# 	$(TOP)/configure/CONFIG_SITE.$(EPICS_HOST_ARCH).Common
# 	$(TOP)/configure/CONFIG_SITE.Common.$(T_A)
# 	$(TOP)/configure/CONFIG_SITE.$(EPICS_HOST_ARCH).$(T_A)
#
sub cpuEnv {
    my @includes = grep !m/^ (RULES | TEMPLATE_TOP) $/x, @cfgVars;
    unlink($outfile);
    open(OUT,">$outfile") or die "$! creating $outfile";

    my $cpuBootSubDir = $cwd;
    $cpuBootSubDir =~ s/^.*\///;  # cpuBootSubDirname is last component of directory name

    print OUT "export CPU=$cpuBootSubDir\n";
	if ( defined $arch ) {
		print OUT "export CPU_ARCH=$arch\n";
	}

    foreach my $app (@includes) {
		#print "cpuEnv: macro $app=$cfgMacros{$app}\n";
        my $iocpath = my $path = $cfgMacros{$app};
        $iocpath =~ s/^$root/$iocroot/o if ($opt_t);
        $iocpath =~ s/([\\"])/\\$1/g; # escape back-slashes and double-quotes
    	print OUT "export $app=$iocpath\n";
    }
    close OUT;
}

#
# Generate envPaths file with epicsEnvSet commands for iocsh IOCs.
# Include parentheses anyway in case CEXP users want to use this.
#
sub envPaths {
    my @includes = grep !m/^ (RULES | TEMPLATE_TOP) $/x, @apps;

    unlink($outfile);
    open(OUT,">$outfile") or die "$! creating $outfile";

    my $ioc = $cwd;
    $ioc =~ s/^.*\///;  # iocname is last component of directory name

    print OUT "epicsEnvSet(\"IOC\",\"$ioc\")\n";

    foreach my $app (@includes) {
        my $iocpath = my $path = $macros{$app};
        $iocpath =~ s/^$root/$iocroot/o if ($opt_t);
        $iocpath =~ s/([\\"])/\\$1/g; # escape back-slashes and double-quotes
        print OUT "epicsEnvSet(\"$app\",\"$iocpath\")\n" if (-d $path);
    }
    close OUT;
}

#
# Check RELEASE file consistency with support modules
#
sub checkRelease {
    my $status = 0;
    delete $macros{RULES};
    delete $macros{TOP};
    delete $macros{TEMPLATE_TOP};

    while (my ($app, $path) = each %macros) {
        my %check = (TOP => $path);
        my @order = ();
        my $relfile = "$path/configure/RELEASE";
        readReleaseFiles($relfile, \%check, \@order, $arch);
		printMacros( "checkRelease checking macros", \%check ) if $opt_d;
        expandRelease(\%check, "while checking module\n\t$app = $path");
        delete $check{TOP};
        delete $check{EPICS_HOST_ARCH};

        while (my ($parent, $ppath) = each %check) {
            if (exists $macros{$parent} &&
                AbsPath($macros{$parent}) ne AbsPath($ppath)) {
                print "\n" unless ($status);
                print "Definition of $parent conflicts with $app support.\n";
                print "In this application or module, a RELEASE file\n";
                print "conflicts with $app at $path\n";
                print "  Here: $parent = $macros{$parent}\n";
                print "  $app: $parent = $ppath\n";
                $status = 1;
            }
        }
    }

    # For SLAC RELEASE files, commit 67097456 causes too many uneeded
    # and unwanted errors.
    # For example, if TPG_MODULE_VERSION happens to be the same as TPR_MODULE_VERSION
    # Thus it has been removed here.
    # commit 67097456, Andrew Johnson	2016-05-03
    #	Added a test for macros w/ the same value that are not adjacent
    #	to fix an issue w/ mixing Debian modules with privately-built applications.

    print "\n" if $status;
    exit $status;
}

# print out these macros w/ a header line
sub printMacros {
    my ($header, $RmacroList) = @_;
    print "$header:\n";
    while ( my ( $macro, $val ) = each %{$RmacroList} ) {
        print "\t$macro\t=\t$val\n";
    }
}
