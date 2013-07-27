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
    my $juice_set_array = shift;

    my %product_set;
    for my $juice_set (@{ $juice_set_array }) {
        $product_set{$juice_set->name} = $juice_set;
    }

    bless {
        total       => 0,
        product_set => \%product_set,
    }, $class;
}

sub receive {
    my $self = shift;
    my $receive = shift;

    return $receive if !$IS_ALLOW_MONEY{$receive};

    $self->{total} += $receive;

    $self;
}

sub total {
    my $self = shift;

    $self->{total};
}

sub refund {
    my $self = shift;

    my $refund = $self->{total};
    $self->{total} = 0;

    $refund;
}

sub product_names {
    my $self = shift;

    my @keys = keys %{ $self->{product_set} };
    \@keys;
}

1;
