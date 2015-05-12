#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(say state);
use Digest::MD5;
use Data::Dumper;

my $md5 = Digest::MD5->new; 

my $dir1 = $ARGV[0];
my $dir2 = $ARGV[1];
chomp $dir1;
chomp $dir2;

my @src_files = glob_recursive($dir1);
my @dest_files = glob_recursive($dir2);

my %md5a;
my %md5b;

hash_md5(
  {
    files => \@src_files,
    md5 => \%md5a
  }
);
hash_md5(
  {
    files => \@dest_files,
    md5 => \%md5b
  }
);

print "md5 change report (begin):\n";
for my $src_key (keys %md5a) {
  $src_key =~ s/^$dir1\/(.*)/$1/; 
  
  for my $dest_key (keys %md5b) {
  $dest_key =~ s/^$dir2\/(.*)/$1/;
    #if ($dest_key =~ m/^$dir2\/($src_file)$/ && $md5b{"$dir2/$src_file"} eq $md5a{"$dir1/$src_file"}) {
    if ($src_key eq $dest_key && $md5a{"$dir1/$src_key"} eq $md5b{"$dir2/$dest_key"}) {
      print "no - $src_key\n";
    }
    #elsif ("$dir1/$src_file" eq "$dir2/$src_file" && $md5a{"$dir1/$src_file"} ne $md5b{"$dir2/$src_file"}) {
    elsif ($src_key eq $dest_key && $md5a{"$dir1/$src_key"} ne $md5b{"$dir2/$dest_key"}) {
      print "YES - $src_key\n";
    } 
  } 
}
#print "md5 change report (end):\n";


sub hash_md5 {
  my ($opts) = @_;
  
  for my $filename (@{$opts->{files}}) {
    open my $fh2, '<', $filename or die $!;
    binmode($fh2);
    $opts->{md5}->{$filename} = $md5->addfile($fh2)->hexdigest;
    close $fh2;
  }
}

sub glob_recursive {
  my ($dir) = @_;
  # change from state to my
  my @return_files;
  my @files = glob("$dir/*");

  for my $file ( @files ) {
    chomp $file;
    if ( -f $file ) {
      #say "File: $file";
      push @return_files, $file;
    }
    if ( -d $file ) {
      #say "Directory: $file\n";
      push @return_files, glob_recursive($file);
    }
  }
  return @return_files;
}
