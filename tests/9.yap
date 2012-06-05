:- udi(a(btree,-)).
%:- ['../data/32k.yap'].

y(A) :-
        A #< 500000000.0, 
        a(A,ID).
