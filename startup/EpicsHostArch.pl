#!/usr/bin/env perl
#*************************************************************************
# Copyright (c) 2018 UChicago Argonne LLC, as Operator of Argonne
#     National Laboratory.
# EPICS BASE is distributed subject to a Software License Agreement found
# in file LICENSE that is included with this distribution.
#*************************************************************************

# Returns an architecture name for EPICS_HOST_ARCH that should be
# appropriate for the CPU that this version of Perl was built for.
# Any arguments to the program will be appended with separator '-'
# to allow flags like -gnu -debug and/or -static to be added.

# Before Base has been built, use a command like this:
#   bash$ export EPICS_HOST_ARCH=`perl src/tools/EpicsHostArch.pl`
#
# If Base is already built, use
#   tcsh% setenv EPICS_HOST_ARCH `perl base/lib/perl/EpicsHostArch.pl`

# If your architecture is not recognized by this script, please send
# the output from running 'perl --version' to the EPICS tech-talk
# mailing list to have it added.

use strict;

use Config;
use POSIX;

use Config qw( config_sh myconfig );

my( $suffix )="";
my( $suffix )="-".$ARGV[0] if ($ARGV[0] ne "");

my( $gcc )="";
my( $gccVers )='';
my( $gccExe )=`which gcc`;
if ( "$gccExe" ne "" ) {
	$gccVers=`gcc -dM -E - < /dev/null | egrep __VERSION__`;
	if ($gccVers =~ m/4.9.4/) { $gcc="-gcc494"; }
}
#print "gcc=$gcc\n";

#print join('-', HostArch(), @ARGV), "\n";
my( $EpicsHostArch ) = HostArch();
print "$EpicsHostArch$suffix";

sub HostArch {
    my( $arch ) = $Config{'archname'};
    #print "Config{'archname'}=".$arch."\n";
    if ($arch =~ /sun4-solaris/)        { return "solaris-sparc";
    } elsif ($arch =~ m/i86pc-solaris/) { return "solaris-x86";
    } elsif ($arch =~ m/arm-linux/)     { return "linux-arm";
    } elsif ($arch =~ m/linux/)        {
            my($kernel, $hostname, $release, $version, $cpu) = POSIX::uname();
            if ($cpu =~ m/i686/)			{ return "linux-x86";  }
            if ($cpu =~ m/x86_64/)	{
				if ($release =~ m/el5/)     { return "linux-x86_64";  }
				elsif ($release =~ m/2.6.35.13-rt/)  { return "linux-x86_64"; }
				elsif ($release =~ m/3.14.12-rt9/)  { return "linuxRT-x86_64"; }
				elsif ($release =~ m/3.18.11-rt7/)  { return "linuxRT-x86_64"; }
				elsif ($release =~ m/-rt/)  { return "linuxRT-x86_64"; }
				elsif ($release =~ m/el6/)  { return "rhel6-x86_64"; }
				elsif ($release =~ m/el7/)  { if ( $gcc eq "-gcc494" ) { return "rhel7-gcc494-x86_64";
					} else { return "rhel7-x86_64"; } }
				elsif ($release =~ m/el8/)  { return "rhel8-x86_64"; }
				elsif ($release =~ m/el9/)  { return "rhel9-x86_64"; }
				elsif ($release =~ m/2.6.26.1/)  { return "linux-x86_64"; }
			}
            else							{ return "unsupported"; }
    } elsif ($arch =~ m/MSWin32-x86/)   { return "win32-x86";
    } elsif ($arch =~ m/MSWin32-x64/)   { return "windows-x64";
    } elsif ($arch =~ m/cygwin/)        {
            my($kernel, $hostname, $release, $version, $cpu) = POSIX::uname();
            if ($cpu =~ m/x86_64/)      { return "cygwin-x86_64";  }
	    return "cygwin-x86";
    } elsif ($arch =~ m/darwin/)        {
            my($kernel, $hostname, $release, $version, $cpu) = POSIX::uname();
            if ($cpu =~ m/Power Macintosh/) { return "darwin-ppc";  }
            elsif ($cpu =~ m/i386/)         { return "darwin-x86";  }
            elsif ($cpu =~ m/x86_64/)       { return "darwin-x86";  }
            else                            { return "unsupported"; }
    } else { return "unsupported"; }
}

#EOF EpicsHostArch.pl

