% === Facts ===
mammal(dog).
bird(parrot).
reptile(snake).

carnivore(snake).
omnivore(dog).
herbivore(parrot).

can_fly(parrot).
can_swim(dog).
cannot_fly(snake).

lives_in(dog, house).
lives_in(parrot, forest).
lives_in(snake, desert).

% === Rules ===
is_animal(X) :- mammal(X).
is_animal(X) :- bird(X).
is_animal(X) :- reptile(X).

is_predator(X) :- carnivore(X).
is_predator(X) :- omnivore(X).

aerial_animal(X) :- bird(X), can_fly(X).
aquatic_animal(X) :- can_swim(X), \+ can_fly(X).

can_survive_in(X, Place) :- lives_in(X, Place).
