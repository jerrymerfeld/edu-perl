#!/usr/bin/env perl
use strict;
use warnings;

for (1 .. 25) {
  my $num = int($_);
  $num = square_root($num);
  $num = perfect_square($num);
}

sub square_root {
  my ($num) = @_; 
  print "Square root for $num\n";
  $num = sqrt($num);
  print "$num\n";
  return $num;
}

sub perfect_square {
  my ($num) = @_;
  $num = int($num);
  if ($num * $num == $_) { 
    print "$_ is a perfect square!\n";
  }
}
