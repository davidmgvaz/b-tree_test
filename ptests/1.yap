:- use_module(library(lists)).

y(A) :-
        findall(D,a(D,ID),L), 
        min_list(L,A), !.
        
