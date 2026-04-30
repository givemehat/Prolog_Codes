maxlist([X], X).

maxlist([H|T], Max) :-
    maxlist(T, MaxT),
    H > MaxT, !,
    Max = H.

maxlist([_|T], Max) :-
    maxlist(T, Max).
