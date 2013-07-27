use strict;
use warnings;
use utf8;
use Test::More;
use Test::Pretty;
use FindBin;
use Juice;

subtest 'Juiceクラスは名前を持っている' => sub {
    my $name = 'コーラ';

    my $juice = Juice->new(name => $name);

    is $juice->name, $name, '名前が返って来ているか';
};

done_testing;
