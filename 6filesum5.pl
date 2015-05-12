#!/usr/bin/env perl
use strict;
use warnings;

# Create a function that goes through two directories and
# returns files into two separate arrays.  Do not use
# closures. 

my $dir1 = $ARGV[0];
my $dir2 = $ARGV[1];

opendir(D, $dir1) || die "Can't open directory $dir1: $!\n";
my @src_files = readdir(D);
closedir(D);

opendir(D, $dir2) || die "Can't open directory $dir2: $!\n";
my @dest_files = readdir(D);
closedir(D);

for my $s (@src_files) {
   print "\$s = $s\n";
}

for my $d (@dest_files) {
   print "\$d = $d\n";
}

#sub subdir {
#   my @subdir_files = readdir($f);
#}
