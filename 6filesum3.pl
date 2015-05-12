#!/usr/bin/env perl

## modules
use strict;
use warnings;
use feature 'say';
use Path::Iterator::Rule;


## variable initialization
my $flag1 = $ARGV[0];
my $src = $ARGV[1];
my $flag2 = $ARGV[2];
my $dest = $ARGV[3];
my $rule = Path::Iterator::Rule->new;

## flag and source if check
if ($src && $flag1 eq '-s') {
  ## call to cpath to have path cleaned up
  $src = cpath($src);
  ## for loop for source files
  for my $file ( $rule->all( $src ) ) {
    my $cfile = cpath($file);
    say $cfile;
  }
}
## error for source arguments
else {
  say "Please enter a source path following the -s flag."
}

## flag and destination if check
if ($dest && $flag2 eq '-d') {
  ## call to cpath to have path cleaned up
  $dest = cpath($dest);
  ## for loop for destination files
  for my $file ( $rule->all( $dest ) ) {
    my $cfile = cpath($file);
    say $cfile;
  }
}
## error for destination arguments
else {
  say "Please enter a destination path following the -d flag.";
}


## subroutine to clean path of trailing forward slash if present
sub cpath {
  ## the following, $path wrapped in parenthesis to enforce list context;
  my ($path) = @_;
  ## the following was provided by Daniel
  # return $path if $path =~ /^(?:\/?\w+\.?\w+\/?)+$/;
  ## the following works but does not accept trailing forward slashes
  # return $path if $path =~ /^(?:\.*\/?\w*\.*\w+)+$/;
  ## testing
  return $path if $path =~ /^(?:\.*\/?\w*\.*\w+)+$/;
}
