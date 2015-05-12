#!/usr/bin/env perl

use strict;
use warnings;

if ( $reply =~ m/^[0-9]+$/ ) {
  "only digits\n";
} else {
  "not only digits\n";
}
