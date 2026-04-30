reverse(List, Reversed) :-
    reverse_acc(List, [], Reversed).

reverse_acc([], Acc, Acc).

reverse_acc([H|T], Acc, R) :-
    reverse_acc(T, [H|Acc], R).
