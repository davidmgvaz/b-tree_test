:- ['32k.yap'].



%% test((min A, a(A,B))).
%% test((max A, a(A,B))).

%%test((a(A,X), a(A,Y), fail)).

%% test((a(A,B), A > 900000000.0, fail)).
%% test((a(A,B), A > 800000000.0, fail)).
%% test((a(A,B), A > 500000000.0, fail)).
%% test((a(A,B), A > 1.0, fail)).

%% test((a(A,B), A < 100000000.0, fail)).
%% test((a(A,B), A < 200000000.0, fail)).
%% test((a(A,B), A < 500000000.0, fail)).
%% test((a(A,B), A < 1000000000.0, fail)).

%% test((a(A,B), A > 450000000.0, A < 550000000.0, fail)).
%% test((a(A,B), A > 300000000.0, A < 700000000.0, fail)).
%% test((a(A,B), A > 250000000.0, A < 750000000.0, fail)).
%% test((a(A,B), A > 1.0, A < 1000000000.0, fail)).

test((a(A,X), a(B,Y), B < A, fail)).

b(X) :-
        test(A),
        write(A),nl,
        time(A),
        fail.
b(_).

:- write('start'),nl,b(_), halt.