position(door).
position(window).
position(middle).

move(state(middle, onbox, middle, hasnot), grasp, state(middle, onbox, middle, has)).
move(state(P, onfloor, P, H), climb, state(P, onbox, P, H)).
move(state(P, onfloor, P, H), push(P, Q), state(Q, onfloor, Q, H)) :- 
    position(Q), P \= Q.
move(state(P, onfloor, B, H), walk(P, Q), state(Q, onfloor, B, H)) :- 
    position(Q), P \= Q.

canget(State) :- canget(State, 15).
canget(state(_, _, _, has), _).
canget(State, D) :-
    D > 0,
    move(State, _, Next),
    D1 is D - 1,
    canget(Next, D1).
