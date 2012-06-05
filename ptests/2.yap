:- use_module(library(lists)).

y(A) :-
        findall(D,a(D,ID),L),
        max_list(L,A), !.