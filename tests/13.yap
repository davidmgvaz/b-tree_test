:- udi(a(btree,-)).
%:- ['../data/32k.yap'].

y(A) :-
        A #> 250000000.0, A #< 750000000.0,
        a(A,ID).
