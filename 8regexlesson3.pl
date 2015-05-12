#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

while (1) {
  print "Please enter your social security number: ";
  my $input = <STDIN>;

  ## Uses parenthesis to capture matches
  ## \d is for digits 0-9
  ## (?:) does not capture but groups
  if ( $input =~ /(\d{3})-(\d{2})-(\d{4})/ ) {
    say $1; ## Capture 1
    say $2; ## Capture 2
    say $3;
    last;
  }
  else {
    say "Not a valid social security number!";
  }
}
