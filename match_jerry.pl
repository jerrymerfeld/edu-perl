#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use Text::Roman qw(:all);
use Text::Fuzzy;

## open giantbomb_titles.txt as $gb_file for input
open my $gb_file, '<', 'giantbomb_titles.txt' or die $!;
## initialize %gb hash
my %gb;
## run while $val = line of $gb_file for input
while (my $val = <$gb_file>) {
  ## remove new line from $val
  chomp $val;
  ## assign lowercase $val to $key
  my $key = lc $val;
  ## remove non-word characters
  $key =~ s/\W//g;
  ## split keys by one or more spaces as @words
  my @words = split /\s+/, $key;
  ## joins titles with roman numerals as titles with
  ## integers for titles with spaces
  $key = join " ", map { isroman($_) ? roman2int($_) : $_ } @words;
  ## remove instances of a-z (any case)
  $key =~ tr/a-zA-Z//s;
  ## store $val as $key in $gb
  $gb{$key} = $val;
}
## close the $gb_file
close $gb_file;
## initialize @gb_array with %gb keys
my @gb_array = keys %gb;

## initialize $file using first argument
my $file = $ARGV[0];
## remove new line from $file
chomp $file;
## open $file (first argument) as $other_file for input
open my $other_file, '<', $file or die $!;
## run while $val = line of $other_file
while (my $val = <$other_file>) {
  ## remove new line from $val
  chomp $val;
  ## assign $val to $key in lowercase
  my $key = lc $val;
  ## remove "psp" or "ps vita" or "ps "+[0-9] or "goty" or "edition" or
  ## "remastered" or "hd"
  $key =~ s/\b(?:psp|ps\s?vita|ps\s?\d|goty|edition|remastered|hd)\b//g;
  ## remove any non-word characters
  $key =~ s/\W//g;
  ## split keys by spaces as @words
  my @words = split /\s+/, $key;
  ## joins titles with roman numerals as titles with
  ## integers for titles with spaces
  $key = join " ", map { isroman($_) ? roman2int($_) : $_ } @words;
  ## remove instances of a-z (any case)
  $key =~ tr/a-zA-Z//s;
  # if a $gb{$key} exists...
  if ( !exists $gb{$key} ) {
    ## initialize new Text::Fuzzy object as $tf
    my $tf = Text::Fuzzy->new($key);
    ## initialize $nearest as $tft nearest to @gb_array
    my $nearest = $tf->nearest(\@gb_array);
    print "Nearest array entry for $key is ", $gb_array[$nearest], "\n";
  }
}
close $other_file;
