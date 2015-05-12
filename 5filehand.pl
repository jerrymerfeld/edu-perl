#!/usr/bin/env perl

use strict;
use warnings;

open (my $fh, '>', '5filehandled.out');
print $fh "First file handled by perl\n";
close $fh;
print "done\n";
