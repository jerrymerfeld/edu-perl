#!/usr/bin/env perl

# use strict;
# use warnings;

print "Enter a temperature (e.g. 32F, 100C):\n";
$input = <STDIN>; # this reads one line from the user.
chomp($input);    # this removes the ending newline from $input.

if ($input =~ m/^([-+]?[0-9]+(\.[0-9]*)?)\s*([CF])$/i)
{
  # if we get in here, we had a match. $1 is the number, $3 is "C" or "F".
  $inputNum = $1;   # Save to named variables to make the...
  $type = $3;       # ...rest of the program easier to read.

  if ($type =~ m/c/i) {       # Is it "c" or "C"?
    # The input was Celsius so calculate Farenheit
    $celsius = $inputNum;
    $farenheit = ($celsius * 9 / 5) + 32;
  } else {
    # If not "C", it must be an "F" so calculate Celsius
    $farenheit = $inputNum;
    $celsius = ($farenheit - 32) * 5 / 9;
  }
  # At this point, we have both temperatures so display the results:
  printf "%.2f C is %.2f F\n", $celsius, $farenheit;;

} else {
  # The initial regex did not match so issue a warning.
  print "Expecting a number followed by \"C\" or \"F\",\n";
  print "so I don't understand \"$input\".\n";
}
