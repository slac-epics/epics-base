eval 'exec perl -S $0 ${1+"$@"}'  # -*- Mode: perl -*-
    if $running_under_some_shell; # EpicsHostArch.pl
#*************************************************************************
# Copyright (c) 2011 UChicago Argonne LLC, as Operator of Argonne
#     National Laboratory.
# Copyright (c) 2002 The Regents of the University of California, as
#     Operator of Los Alamos National Laboratory.
# EPICS BASE is distributed subject to a Software License Agreement found
# in file LICENSE that is included with this distribution.
#*************************************************************************

# Returns the Epics host architecture suitable
# for assigning to the EPICS_HOST_ARCH variable

use Config;
use POSIX;

use Config qw( config_sh myconfig );

$suffix="";
$suffix="-".$ARGV[0] if ($ARGV[0] ne "");

my( $gcc )="";
my( $gccExe )=`which gcc`;
if ( "$gccExe" ne "" ) {
	my( $gccVers )=`gcc -dM -E - < /dev/null | egrep __VERSION__`;
	if ($gccVers =~ m/4.9.4/) { $gcc="-gcc494"; }
}
#print "gcc=$gcc\n";

$EpicsHostArch = GetEpicsHostArch();
print "$EpicsHostArch$suffix";

sub GetEpicsHostArch { # no args
    $arch=$Config{'archname'};
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
				elsif ($release =~ m/el7/)  { if ( $gcc =~ "-gcc494" ) { return "rhel7-gcc494-x86_64";
					} else { return "rhel7-x86_64"; } }
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

