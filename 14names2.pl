#!/usr/bin/env perl

use strict;
use warnings;

my %names = (
   'Jerry'  => 'Merfeld',
   'Daniel' => 'Amaya',
);

for my $name (keys %names) {
   print "$name $names{$name}\n";
}

print "Please enter your first name:\n";
my $user_name = <>;
chomp($user_name);
$user_name =~ s/^([A-Z])([a-z]*)/\U$1\L$2/i;

print "Hello $user_name $names{$user_name}\n";
