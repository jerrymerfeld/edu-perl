#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

my $foo = 'aaaaaaaaaabbbbbbbccc';

$foo = $1 if $foo =~ /(.*?)c/;

# $foo = $1 if $foo =~ /(.*)b/;
## the `?` makes it non-greedy, meaning it stops at the first b
# $foo = $1 if $foo =~ /(.*?)b/;
say $foo;
