% A simple twenty questions-style game.
% Copyright (C) 2018  Austin D. Ray
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU Affero General Public License as
% published by the Free Software Foundation, either version 3 of the
% License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Affero General Public License for more details.
%
% You should have received a copy of the GNU Affero General Public License
% along with this program.  If not, see <https://www.gnu.org/licenses/>.

% Declare the types for every item in the game.
type(rabbit,      animal).
type(dog,         animal).
type(fish,        animal).
type(whale,       animal).
type(dinosaur,    animal).
type(snake,       animal).
type(pterodactyl, animal).
type(starfish,    animal).
type(ant,         animal).
type(eagle,       animal).
type(shark,       animal).
type(chicken,     animal).
type(horse,       animal).
type(lion,        animal).

type(rose,      plant).
type(carrot,    plant).
type(orange,    plant).
type(seaweed,   plant).
type(coral,     plant).

type(pencil,    object).
type(cup,       object).
type(computer,  object).
type(car,       object).
type(boat,      object).
type(submarine, object).

% Add living things to the alive category
alive(rabbit).
alive(dog).
alive(snake).
alive(fish).
alive(whale).
alive(carrot).
alive(orange).
alive(seaweed).
alive(coral).
alive(starfish).
alive(ant).
alive(eagle).
alive(shark).
alive(chicken).
alive(horse).
alive(rose).
alive(lion).
alive(rose).

% Add mammals to the mammal category
mammal(rabbit).
mammal(dog).
mammal(whale).
mammal(horse).
mammal(pterodactyl).
mammal(shark).
mammal(lion).

roar(lion).

fly(pterodactyl).
fly(eagle).

egg(eagle).
egg(chicken).
egg(shark).

red(rose).
red(starfish).

swim(shark).
swim(whale).
swim(fish).

neigh(horse).

% Add things that belong in water to the water category
water(boat).

vehicle(boat).
vehicle(submarine).
vehicle(car).

underwater(submarine).
underwater(whale).
underwater(fish).
underwater(coral).
underwater(seaweed).
underwater(shark).
underwater(starfish).

liquid(cup).

writes(pencil).

insect(ant).

fruit(orange).

ferner(coral).

friend(dog).

% Question that the game will ask.
% It is simple call and response I/O.
% The only new functions are ask_water and ask_mammal.
ask_type(Type)              :- write('Is it an animal, plant, or object? \n'),        read(Type).
ask_vehicle(Vehicle)        :- write('Is it a vehicle? (yes/no) \n'),                 read(Vehicle).
ask_water(Water)            :- write('Does it belong on the water? (yes/no) \n'),     read(Water).
ask_underwater(Underwater)  :- write('Does it belong underwater? (yes/no) \n'),       read(Underwater).
ask_alive(Life)             :- write('Is it alive? (yes/no) \n'),                     read(Life).
ask_mammal(Mammal)          :- write('Is it a mammal? (yes/no) \n'),                  read(Mammal).
ask_friend(Friend)          :- write('Is it man\'s best friend? (yes/no) \n'),        read(Friend).
ask_ferner(Ferner)          :- write('Is it a misclassified by Ferner? (yes/no) \n'), read(Ferner).
ask_fruit(Fruit)            :- write('Is it a fruit? (yes/no)'),                      read(Fruit).
ask_liquid(Liquid)            :- write('Can it hold liquid? (yes/no)'),read(Liquid).
ask_write(Write)            :- write('Can you write with it? (yes/no)'),read(Write).
ask_insect(Insect)            :- write('Is it an insect? (yes/no)'),                      read(Insect).
ask_roar(Roar)            :- write('Does it roar? (yes/no)'),                      read(Roar).
ask_fly(Fly)            :- write('Can it fly? (yes/no)'),                      read(Fly).
ask_egg(Egg)            :- write('Does it lay eggs? (yes/no)'),                      read(Egg).
ask_red(Red)            :- write('Is it red? (yes/no)'),                      read(Red).
ask_swim(Swim)            :- write('Does it swim? (yes/no)'),                      read(Swim).
ask_neigh(Neigh)            :- write('Does it neigh? (yes/no)'),                      read(Neigh).

% Play the game or with my sanity!
guess(Thing) :-
(
  ask_type(Type),
  ((Type == object) -> Life = no                      ; ask_alive(Life)),
  ((Type == animal) -> ask_friend(Friend)             ; Friend = no),
  ((Type == animal) -> ask_mammal(Mammal)             ; Mammal = no),
  ((Type == plant)  -> ask_ferner(Ferner)             ; Ferner = no),
  ((Type == plant)  -> ask_fruit(Fruit)               ; Fruit = no),
  ((Type == object) -> ask_vehicle(Vehicle)           ; Vehicle = no),
  ((Type == object) -> ask_water(Water)               ; Water = no),
  ask_underwater(Underwater),
  ((Type == object) -> ask_liquid(Liquid)             ; Liquid = no),
  ((Type == object) -> ask_write(Write)               ; Write = no),
  ((Type == animal) -> ask_insect(Insect)             ; Insect = no),
  ((Type == animal) -> ask_roar(Roar)                 ; Roar = no),
  ((Type == animal) -> ask_fly(Fly)                   ; Fly = no),
  ((Type == animal) -> ask_egg(Egg)                   ; Egg = no),
  ((Type == animal) -> ask_neigh(Neigh)               ; Neigh = no),
  ((Type == object) -> Red = no                       ; ask_red(Red)),
  ((Type == animal) -> ask_swim(Swim)                 ; Swim = no),
  report(Thing, Type, Life, Mammal, Vehicle, Water, Underwater, Ferner, Fruit, Friend,
       Liquid, Write, Insect, Roar, Fly, Egg, Neigh, Red, Swim)
).

% Report Yes or No if the item is matched properly.
report(Thing, Type, Life, Mammal, Vehicle, Water, Underwater, Ferner, Fruit, Friend,
       Liquid, Write, Insect, Roar, Fly, Egg, Neigh, Red, Swim) :-
  type(Thing, Type),
  ((Life        == yes) -> alive(Thing);        \+alive(Thing)),
  ((Mammal      == yes) -> mammal(Thing);       \+mammal(Thing)),
  ((Water       == yes) -> water(Thing);        \+water(Thing)),
  ((Underwater  == yes) -> underwater(Thing);   \+underwater(Thing)),
  ((Vehicle     == yes) -> vehicle(Thing);      \+vehicle(Thing)),
  ((Ferner      == yes) -> ferner(Thing);       \+ferner(Thing)),
  ((Fruit       == yes) -> fruit(Thing);        \+fruit(Thing)),
  ((Friend      == yes) -> friend(Thing);       \+friend(Thing)),
  ((Liquid      == yes) -> liquid(Thing);       \+liquid(Thing)),
  ((Write      == yes) -> writes(Thing);       \+writes(Thing)),
  ((Insect      == yes) -> insect(Thing);       \+insect(Thing)),
  ((Roar      == yes) -> roar(Thing);       \+roar(Thing)),
  ((Fly      == yes) -> fly(Thing);       \+fly(Thing)),
  ((Egg      == yes) -> egg(Thing);       \+egg(Thing)),
  ((Neigh      == yes) -> neigh(Thing);       \+neigh(Thing)),
  ((Red      == yes) -> red(Thing);       \+red(Thing)),
  ((Swim      == yes) -> swims(Thing);       \+swims(Thing)).

% vim: filetype=prolog:
