:- udi(a(btree,-)).
%:- ['../data/32k.yap'].

y(A) :-
        A #< 200000000.0, 
        a(A,ID).
