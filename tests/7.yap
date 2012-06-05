:- udi(a(btree,-)).
%:- ['../data/32k.yap'].

y(A) :-
        A #< 100000000.0, 
        a(A,ID).
