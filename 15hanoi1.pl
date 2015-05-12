#!/usr/bin/env perl
use strict;
use warnings;

#Tower of hanoi is recursion
hanoi(3, 'A', 'C', 'B', \&print_instructions); # \& is a "closure" or "subroutine method" that hands print_instructions to hanoi! 

sub print_instructions {
  my ($disk, $start, $end) = @_;

  print "Move disk #$disk from $start to $end\n";
}

sub hanoi {
  my ($n, $start, $end, $extra, $move_disk) = @_;

  if ( $n == 1 ) {
    $move_disk->(1, $start, $end);
  }
  else {
    hanoi($n-1, $start, $extra, $end, $move_disk);
    $move_disk->($n, $start, $end);
    hanoi($n-1, $extra, $end, $start, $move_disk);
  }
}
