#!/usr/bin/env perl

use strict;
use warnings;

my %names = (
  "Jerry" => 'Merfeld',
  "Daniel" => 'Amaya',
);

for my $name (keys %names) {
  print "$name $names{$name}\n";
}

print "Please enter your first name:\n";
my $user_name = <>;
chomp($user_name); # Is this operation performed on the default value?
$user_name =~ s/([a-z])([a-z]*)/\U$1\L$2/i;

print "Searching for $user_name...\n";
print "Hello $user_name $names{$user_name}\n";

print "Thank you for using names $user_name!\n"
