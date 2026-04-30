queens(Solution) :-
    Solution = [Q1, Q2, Q3, Q4],
    permutation([1,2,3,4], Solution),
    safe(Solution).

safe([]).
safe([Q|Others]) :-
    safe(Others),
    no_attack(Q, Others, 1).

no_attack(_, [], _).
no_attack(Q, [Q1|Others], Dist) :-
    Q =\= Q1,
    abs(Q - Q1) =\= Dist,
    Dist1 is Dist + 1,
    no_attack(Q, Others, Dist1).
