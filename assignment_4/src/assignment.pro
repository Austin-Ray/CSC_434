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
type(rabbit,    animal).
type(dog,       animal).
type(fish,      animal).
type(whale,     animal).
type(dinosaur,  animal).
type(snake,     animal).

type(carrot,    plant).
type(orange,    plant).
type(seaweed,   plant).
type(coral,     plant).

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

% Add mammals to the mammal category
mammal(rabbit).
mammal(dog).
mammal(whale).

% Add things that belong in water to the water category
water(fish).
water(whale).
water(seaweed).
water(coral).
water(boat).
water(submarine).

% Question that the game will ask.
% It is simple call and response I/O.
% The only new functions are ask_water and ask_mammal.
ask_type(Type)      :- write('Is it an animal, plant, or object? \n'),    read(Type).
ask_water(Water)    :- write('Does it belong in the water? (yes/no) \n'), read(Water).
ask_alive(Life)     :- write('Is it alive or dead? \n'),                  read(Life).
ask_mammal(Mammal)  :- write('Is it a mammal? (yes/no) \n'),              read(Mammal).

% Guess a thing and ask questions to narrow down the categories.
guess(Thing) :-
  ask_type(Type),
  ((Type == animal; Type == plant) -> ask_alive(Life); Life=dead),
  ((Type == animal) -> ask_mammal(Mammal); Mammal=no),
  ask_water(water); Water=Type,
  report(Thing, Type, Life, Mammal, Water).

% Report Yes or No if the item is matched properly.
report(Thing, Type, Life, Mammal, Water) :-
  type(Thing, Type),
  ((Life == alive) -> alive(Thing);   \+alive(Thing)),
  ((Mammal == yes) -> mammal(Thing);  \+mammal(Thing)),
  ((Water == yes ) -> water(Type);    \+water(Type)).

% vim: filetype=prolog:
