remove_nth(List, N, Result) :-
    remove_nth_helper(List, N, 1, Result).

remove_nth_helper([], _, _, []).

remove_nth_helper([_|T], N, N, Result) :-
    remove_nth_helper(T, N, 1, Result).

remove_nth_helper([H|T], N, Pos, [H1|R]) :-
    Pos \= N,
    process_element(H, N, H1),
    Pos1 is Pos + 1,
    remove_nth_helper(T, N, Pos1, R).

process_element(H, N, H1) :-
    is_list(H),
    remove_nth(H, N, H1).

process_element(H, _, H).
