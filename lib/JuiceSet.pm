package JuiceSet;
use strict;
use warnings;
use utf8;
use Moo;
use Juice;

has name => (is => 'ro');
has price => (is => 'ro');
has number => (is => 'ro');
has stock => (is => 'ro');

sub BUILD {
    my $self = shift;

    my @stock;
    for my $i (1 .. $self->{number}) {
        push @stock, Juice->new(name => $self->{name});
    }
    $self->{stock} = \@stock;

    $self;
}

sub shift_set {
    my $self = shift;

    shift @{ $self->{stock} };
}

1;
