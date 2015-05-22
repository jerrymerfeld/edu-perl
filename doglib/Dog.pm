package Dog;
use strict;
use warnings;
use Data::Dumper;

sub new {
  my ($class,$args) = @_;
  return bless { name => $args->{name} }, $class;
}

sub bark {
  my $self = shift;
  print "Ruff, ruff, my name is $self->{name}\n";
}
1;
