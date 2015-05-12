#!/usr/bin/env perl

#use strict;
#use warnings;

my $src  = $ARGV[0];
my $dest = $ARGV[1];

my @src_files = glob("$src/*");
my @dest_files = glob("$dest/*");

print "Source files:\n";
for my $file (@src_files) {
   print "$file\n";
}

print "Destination files:\n";
for my $file (@dest_files) {
   print "$file\n";
}

exit 0;
