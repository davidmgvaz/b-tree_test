:- [index].

:- udi(a(+,-)).

:- ['32k.yap'].

%% test((min A, a(A,B))).
%% test((max A, a(A,B))).

%% test((a(A,X), B #== A, a(B,Y), fail)).

test((A #> 900000000.0, a(A,B), fail)).
%% test((A #> 800000000.0, a(A,B), fail)).
%% test((A #> 500000000.0, a(A,B), fail)).
%% test((A #> 1.0, a(A,B), fail)).

%% test((A #< 100000000.0, a(A,B), fail)).
%% test((A #< 200000000.0, a(A,B), fail)).
%% test((A #< 500000000.0, a(A,B), fail)).
%% test((A #< 1000000000.0, a(A,B), fail)).

%% test((A #> 450000000.0, A #< 550000000.0, a(A,B), fail)).
%% test((A #> 300000000.0, A #< 700000000.0, a(A,B), fail)).
%% test((A #> 250000000.0, A #< 750000000.0, a(A,B), fail)).
%% test((A #> 1.0, A #< 1000000000.0, a(A,B), fail)).

%% test((a(A,X), B #< A, a(B,Y), fail)).

b(X) :-
        test(A),
        write(A),nl,
        time(A),
        fail.
b(_).

:- write('start'),nl, b(_), halt.