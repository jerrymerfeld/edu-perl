#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

my $in = 'ass.aASDFss/share.asdas,';

say 'good' if test($in);

sub test {
  my ($foo) = @_;

  return 1 if $foo =~ /^(?:\/?\w+\.?\w+\/?)+$/;
  return; #unnecessary as it is implied
}
