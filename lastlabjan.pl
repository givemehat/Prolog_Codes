insert_nth(Item, N, List, Result) :-
    insert_nth_helper(Item, N, List, 1, Result).

insert_nth_helper(_, _, [], _, []).

insert_nth_helper(Item, N, List, N, [Item|R]) :-
    process_list(Item, N, List, R).

insert_nth_helper(Item, N, [H|T], Pos, [H1|R]) :-
    Pos \= N,
    process_element(Item, N, H, H1),
    Pos1 is Pos + 1,
    insert_nth_helper(Item, N, T, Pos1, R).

process_element(Item, N, H, H1) :-
    is_list(H),
    insert_nth(Item, N, H, H1).

process_element(_, _, H, H).

process_list(_, _, [], []).

process_list(Item, N, [H|T], [H1|R]) :-
    process_element(Item, N, H, H1),
    insert_nth_helper(Item, N, T, 2, R).
