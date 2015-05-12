#!/usr/bin/env perl

use strict;
use warnings;

my @farenheit = (
  26.6,
  32,
  35,
  65,
  74,
  78,
);

for my $temp (@farenheit) {
  my $celsius = ($temp - 32) * 5 / 9;
  print "$temp degrees farenheit is $celsius degrees celsius\n";
}
