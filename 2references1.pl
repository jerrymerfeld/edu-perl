#!/usr/bin/env perl

use feature 'say';


# sub reverse_greeting
# {
#   my $name = reverse shift;
#   return "Hello, $name!";
# }
#
# my $name = 'Chuck';
# say reverse_greeting( $name );
# say $name;


# sub reverse_in_place
# {
#   my $name_ref = shift;
#   $$name_ref   = reverse $$name_ref;
# }
#
# my $name = 'Blabby';
# reverse_in_place( \$name );
# say $name;

sub reverse_in_placetest # This is a function for testing from the above
{
  my $name_ref = shift;             # This is where the parameter is picked up
  say "Hello, $$name_ref!";          # The parameter is printed before reversed
  $$name_ref = reverse $$name_ref;  # The parameter is reversed
  say "Hello, $$name_ref!";      # I print the output of the reversed
                                    # parameter to the console
}

my $name = 'Blabby';                # This is the variable initialized
reverse_in_placetest( $name ); # This is where the function is called
say $name;                          # This is the variable printed outside of
                                    # the function
