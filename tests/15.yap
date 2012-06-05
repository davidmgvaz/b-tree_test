:- udi(a(btree,-)).
%:- ['../data/32k.yap'].

y(A) :-
        a(A,_),
        B #== A,
        a(B,ID).
