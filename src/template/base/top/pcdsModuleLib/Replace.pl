#!/usr/bin/perl

sub ReplaceFilenameHook
{
	print "ReplaceFilenameHook: $_[0]\n" if $opt_d;
	return $_[0];
}
sub ReplaceLineHook
{
#	print "ReplaceLineHook: $_[0]\n" if $opt_d;
	return $_[0];
}

# Always end Replace.pl with a "1" so it returns true
1;
