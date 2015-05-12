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
    say $file;
  }
}
## error for destination arguments
else {
  say "Please enter a destination path following the -d flag.";
}


## subroutine to clean path of trailing forward slash if present
sub cpath {
  ## in The following $path not in parenthesis assigns array list item using
  ## scalar context
  # my $path = $_[0];
  ## the following, $path wrapped in parenthesis to enforce list context;
  ## @_ is a default operator
  my ($path) = @_;
  ### how the hell does the regex below work???
  ## $1 holds the first match
  ## anything between the forward slashes is the pattern
  ## it starts with the first forward slash, ends with the last one...
  ### in a regex the parens are matching ()
  ## [] defines character class which means a class of characters to match
  ## the only things I can think of in [] that must be escaped are - and ^,
  ## because they mean something inside the []
  ## a \ escapes the /
  ## the plus sign means 1 or more
  ## the period '.' matches any character but "\n"
  ## * means any character
  ## \w = [a-zA-Z0-9_] i.e., alphanumeric and underscore
  ## the end slash is not in the parens, so it is not put into $1
  ## $ means end-of-line to a regex... so we want to match a literal $, we escape it \$

  ## The following will strip paths with a single trailing forward slash
  # $path = $1 if ( $path =~ /(.*)\/$/ );
  # $path = $1 if ( $path =~ m{(.*)/$} );
  ## The following was a work in progress
  # $path = $1 if ( $path =~ /(.*?)\// );
  ## The following matches one or more of any lowercase letter
  # $path = $1 if ( $path =~ /([a-z]+)/ );
  # $path = $1 if ( $path =~ /([a-zA-Z0-9.\/?]+)/ );
  ## The following matches any path or file containing a-z, 0-9 and _ ending in /
  # $path = $1 if ( $path =~ /([\w.\/?]+)/ );
  ## Provided by Daniel
  # $path =~ /(?:\/?\w+\/?)+/;
  return $path if $path =~ /^(?:\/?\w+\.?\w+\/?)+$/;
  # $path =~ /(?:\/?\w+\w\/?$)+/;
}
