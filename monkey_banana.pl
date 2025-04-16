% Monkey-Banana Problem in Prolog (Fixed)

% Define possible moves between states 
move(state(MonkeyPos, BoxPos, false, HasBanana), state(NewPos, BoxPos, false, HasBanana)) :-
    member(NewPos, [door, window, middle]),
    MonkeyPos \= NewPos.

move(state(Pos, Pos, false, HasBanana), state(NewPos, NewPos, false, HasBanana)) :-
    member(NewPos, [door, window, middle]),
    Pos \= NewPos.

move(state(Pos, Pos, false, HasBanana), state(Pos, Pos, true, HasBanana)).

move(state(middle, middle, true, false), state(middle, middle, true, true)).

% Base case and path predicate (same as before)
path(State, State, Visited, Visited).

path(Current, Goal, Visited, Path) :-
    move(Current, Next),
    \+ member(Next, Visited),
    path(Next, Goal, [Next|Visited], Path).

% Fixed print_steps predicate
print_steps([]).
print_steps([state(M, B, O, H)|T]) :-  % Unpack state components here
    format('Monkey at ~w, Box at ~w, On box: ~w, Has banana: ~w~n', [M, B, O, H]),
    print_steps(T).

% Entry point (same as before)
solve :-
    Initial = state(door, window, false, false),
    Goal = state(_, _, _, true),
    path(Initial, Goal, [Initial], Path),
    reverse(Path, Solution),
    write('Solution Steps:'), nl,
    print_steps(Solution).
