#!/usr/bin/env perl

use Mojo::UserAgent;
use feature 'say';

my $ua = Mojo::UserAgent->new;
say $ua->get('www.☃.net?hello=there' => {Accept => '*/*'})->res->body;
