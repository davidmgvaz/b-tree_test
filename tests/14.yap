:- udi(a(btree,-)).
%:- ['../data/32k.yap'].

y(A) :-
        A #> 1.0, A #< 1000000000.0,
        a(A,ID).
