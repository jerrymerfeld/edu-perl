#!/usr/bin/env perl

use strict;
use warnings;
# use utf8;
use feature 'say';
use Mojo::UserAgent;

my $ua = Mojo::UserAgent->new;
my $tx = $ua->get('http://www.gamefaqs.com/systems.html');

my $dom = $tx->res->dom;
my $output;
# my $allsys = $dom->at('.span8');

# say $allsys;

# my $i = 1;
# for my $pod ( @{ $dom->find('.pod') } ) {
#
#   # say $pod->at('div.body')->at('div.foot');
#   for my $systems ( @{ $pod->find('div.foot') } ) {
#     # say $systems;
#
#     for my $system ( @{ $systems->find('a') } ) {
#       say "System $i";
#       say $system;
#       $i++;
#     }
#   }
# }

for my $pod ( @{ $dom->find('.pod .foot a') } ) {
  say $pod;
}
