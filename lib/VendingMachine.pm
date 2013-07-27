package VendingMachine;
use strict;
use warnings;
use utf8;

our %IS_ALLOW_MONEY = map { $_ => 1 } qw(
    10
    50
    100
    500
    1000
);


sub new {
    my $class = shift;

    bless {
        total => 0,
    }, $class;
}

sub input {
    my $self = shift;
    my $input = shift;

    return $input if !$IS_ALLOW_MONEY{$input};

    $self->{total} += $input;

    $self;
}

sub total {
    my $self = shift;

    $self->{total};
}

1;
