use strict;
use warnings;
use utf8;
use Test::More;
use Test::Pretty;
use FindBin;
use Juice;

subtest 'Juiceクラスは値段と名前を持っている' => sub {
    my($price, $name) = (120, 'コーラ');

    my $juice = Juice->new(price => $price, name => $name);

    is $juice->price, $price, '値段が返って来ているか';
    is $juice->name, $name, '名前が返って来ているか';
};

done_testing;
