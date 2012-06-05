:- udi(a(btree,-)).
%:- ['../data/32k.yap'].

y(A) :-
        A #> 900000000.0, 
        a(A,ID).
