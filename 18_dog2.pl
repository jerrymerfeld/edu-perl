#!/usr/bin/env perl
use strict;
use warnings;
use lib 'doglib';
use Dog;
use Data::Dumper;

my $dog1 = Dog->new({ name => 'Frank' });
$dog1->bark;
