use strict;
use warnings;
use utf8;
use Test::More;
use Test::Pretty;
use FindBin;
use JuiceSet;

subtest 'JuiceSetクラスはジュースの値段と名前と個数を持っている' => sub {
    my $colas = JuiceSet->new(
        name   => 'cola',
        number => 5,
        price  => 120
    );

    is $colas->name, 'cola', '名前が返って来ているか';
    is $colas->price, 120, '値段が返って来ているか';
    is $colas->number, 5, '個数が返って来ているか';
};

subtest 'JuiceSetクラスから一つ取り出すとjuiceオブジェクトが返ってくる' => sub {
    my $colas = JuiceSet->new(
        name   => 'cola',
        number => 5,
        price  => 120
    );

    is ref $colas->shift_set, 'Juice', 'Juiceオブジェクトが返って来ているか';
};

done_testing;
