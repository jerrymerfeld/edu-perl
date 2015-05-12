#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

## Works
my $foo = 'aaaaaaaaaaabbbbbbbbccccc';

## Does not work
# my $foo = 'aaaaaaaaaaabbbbbbbb';

## $ means
## ? following a quantifier means non greedy, following character looking for
## means 0 or 1
my $bar = $1 if $foo =~ /(.*?)c$/;
# my $bar = $1 if $foo =~ /(.*?)c$/;

# my $bar = $1 if $foo =~ /(.*?c)$/;
say $bar;
