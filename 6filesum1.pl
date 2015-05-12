#!/usr/bin/env perl

use strict;
use warnings;

my $dirs = 'source';
my $dird = 'destination';

opendir (DIR, $dirs) or die $!;

while (my $file = readdir(DIR)) {
  # # -f flag prints files, -d flag prints directories
  # next unless (-f "$dirs/$file");
  # next unless (-d "$dirs/$file");
  print "$file\n";
}

closedir(DIR);
