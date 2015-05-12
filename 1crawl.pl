#!/usr/bin/env perl

use strict;
use warnings;
use Mojo::UserAgent;
use Data::Dumper;
use feature 'say';

my $ua = Mojo::UserAgent->new;
my $tx = $ua->get('http://www.giantbomb.com/minecraft/3030-30475/releases/');

# say $tx->res->body;
my $dom = $tx->res->dom;
my $output;
my $title = $dom->at('a.wiki-title')->text if $dom->at('a.wiki-title');
# say $dom->at('a.wiki-title')->text;
$output->{$title}->{desc} = $dom->at('h3.display-view')->text if $dom->at('h3.display-view');

for my $table ( @{ $dom->find('table.table-striped') } ) {
  my $release_name;
  for my $row ( @{ $table->find('tr') } ) {
    # say $row->at('td:first-child')->text;
    if ( $row->at('td:first-child')->text =~ /^release name$/i ) {
      $release_name = $row->at('td:last-child')->text;
    }
    elsif ( $release_name ) {
      my $key = $row->at('td:first-child')->text if $row->at('td:first-child');
      my $value = $row->at('td:last-child')->all_text if $row->at('td:last-child');
      $output->{$title}->{$release_name}->{$key} = $value if $key && $value;
    }
  }
}
print Dumper $output;
