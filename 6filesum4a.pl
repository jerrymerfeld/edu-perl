#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(say state);
use Digest::MD5;

my $md5 = Digest::MD5->new; 

my $dir1 = $ARGV[0];
my $dir2 = $ARGV[1];
chomp $dir1;
chomp $dir2;


my @files = glob_recursive($dir1);
for my $filename (@files) {
  open my $fh, '<', $filename or die $!;
  binmode($fh);
  my $md5a = $md5->addfile($fh)->hexdigest, " $filename\n";
  close $fh;

  $filename =~ s/$dir1/$dir2/g;
  open my $fh2, '<', $filename or die $!;
  binmode($fh2);
  my $md5b = $md5->addfile($fh2)->hexdigest, " $filename\n";
  close $fh2;

  print($md5a eq $md5b ? "$filename good\n" : "$filename bad\n");
}

sub glob_recursive {
  my ($dir) = @_;

  state @return_files;
  my @files = glob("$dir/*");

  for my $file ( @files ) {
    chomp $file;
    if ( -f $file ) {
      push @return_files, $file;
    }
    elsif ( -d $file ) {
      glob_recursive($file);
    }
  }

  return @return_files;
}
