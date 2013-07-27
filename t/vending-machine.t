use strict;
use warnings;
use utf8;
use Test::More;
use Test::Pretty;
use VendingMachine;
use List::Util qw/first/;

subtest 'newするとVendingMachineのインスタンスが返る' => sub {
    my $vm = VendingMachine->new;

    is ref $vm, 'VendingMachine', 'VendingMachineが返って来ているか';
};

subtest '投入を複数回でき、自分が返ってくる' => sub {
    my $vm = VendingMachine->new;

    is ref $vm->receive(10)->receive(10), 'VendingMachine', 'VendingMachineが返って来ているか';
};

subtest 'totalメソッドが動く' => sub {
    subtest 'receiveを複数回を行いtotalを呼ぶと総計が返ってくる' => sub {
        my $vm = VendingMachine->new;

        $vm->receive(10);
        $vm->receive(10);
        is $vm->total, 20, 'receiveした値が返って来ているか';
    };

    subtest 'receiveを呼ばずにtotalを呼ぶと0が返ってくる' => sub {
        my $vm = VendingMachine->new;

        is $vm->total, 0, '0が返って来ているか';
    };
};

subtest '1円を入れるとreceiveは想定外なのを1円を返し、totalには加算しない' => sub {
    my $vm = VendingMachine->new;

    subtest '想定外のお金を入れるとそのまま返す' => sub {
        subtest '1円を入れるとreceiveは想定外なのを1円を返す' => sub {
            is $vm->receive(1), 1, '1円が返ってくるか';
        };

        subtest '5円を入れるとreceiveは想定外なのを5円を返す' => sub {
            is $vm->receive(5), 5, '5円が返ってくるか';
        };

        subtest '5000円を入れるとreceiveは想定外なのを5円を返す' => sub {
            is $vm->receive(5000), 5000, '5000円が返ってくるか';
        };
    };

    subtest '想定外のreceiveがあってもtotalには加算されない' => sub {
        is $vm->total, 0, '0のままか';
    };
};

subtest '払い戻しをすると現在の総計が返って来て、総計が0である' => sub {
    my $vm = VendingMachine->new;

    $vm->receive(10);

    is $vm->refund, 10, '現在の総計である10が返って来るか';
    is $vm->total, 0, '総計が0になったか';
};

subtest 'VendingMachineを作る時に初期状態としてジュースをセットできる' => sub {
    use JuiceSet;
    my $colas = JuiceSet->new(
        name   => 'cola',
        number => 5,
        price  => 120
    );
    my $vm = VendingMachine->new([$colas]);

    ok first { $_ eq 'cola' } @{ $vm->product_names }, 'juice_setにcolaがある';
};


done_testing;
