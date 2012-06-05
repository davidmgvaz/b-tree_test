:- udi(a(btree,-)).
%:- ['../data/32k.yap'].

y(A) :-
        A #> 800000000.0, 
        a(A,ID).
