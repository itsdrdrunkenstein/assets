% Define possible moves between states
move((A,B), (7,B)) :- A < 7.   % Fill the 7-unit jug
move((A,B), (A,4)) :- B < 4.   % Fill the 4-unit jug
move((A,B), (0,B)) :- A > 0.   % Empty the 7-unit jug
move((A,B), (A,0)) :- B > 0.   % Empty the 4-unit jug

% Pour from 7-unit to 4-unit jug
move((A,B), (NewA,NewB)) :-
    A > 0,
    B < 4,
    Pour is min(A, 4 - B),
    NewA is A - Pour,
    NewB is B + Pour.

% Pour from 4-unit to 7-unit jug
move((A,B), (NewA,NewB)) :-
    B > 0,
    A < 7,
    Pour is min(B, 7 - A),
    NewA is A + Pour,
    NewB is B - Pour.

% Base case: goal reached
path((0,1), _, Visited, Visited).

% Recursive case: find next valid move
path(Current, Goal, Visited, Path) :-
    move(Current, Next),
    \+ member(Next, Visited),
    path(Next, Goal, [Next|Visited], Path).

% Entry point to solve the problem
solve :-
    path((7,4), (0,1), [(0,0)], Path),
    reverse(Path, Solution),
    write('Solution Steps:'), nl,
    print_steps(Solution).

% Helper to print the solution steps
print_steps([]).
print_steps([H|T]) :-
    write(H), nl,
    print_steps(T).
