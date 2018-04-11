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
water(boat).

vehicle(boat).
vehicle(submarine).
vehicle(car).

underwater(submarine).
underwater(whale).
underwater(fish).
underwater(coral).
underwater(seaweed).

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

% Play the guessing game
% Or lose your mind while writing it
% There are tooooo many issues with Prolog that I do not have time to figure out
% HAVE FUN WITH THIS HOT MESS!
guess(Thing) :- (ask_type(Type),
% If object
((Type == object) ->
  (
    ask_vehicle(Vehicle),
    % If Vehicle
    ((Vehicle == yes) -> (
      ask_water(Water),
      ((Water == no) -> (
        ask_underwater(Underwater)
      ) ; (Underwater = no))
    ) ; (Water = no, Underwater = no)), % Else not a vehicle so no water or underwater.
  % Common to all objects
  Ferner = no,
  Mammal = no,
  Life = no,
  Fruit = no,
  Friend = no
) ;
(
  % This is an else statement.
  % SOFTWARE SHOULD NOT BE WRITTEN LIKE THIS BUT I'VE LOST MY MIND
  ((Type == animal) ->
    (
      ask_alive(Life),
      ((Life == yes) -> (
        ask_mammal(Mammal),
        ask_underwater(Underwater),
        ((Underwater == no) ->
          (
            ask_friend(Friend)
          ) ; (Friend = no))
        ) ; (Mammal = no, Underwater = no, Friend = no)),

        Fruit = no,
        Ferner = no,
        Vehicle = no,
        Water = no
      ) ;
      (
        % WELCOME TO THE SECOND ELSE WOOT WOOT BAD CODE
        % But it works!
        ((Type == plant) ->
          (
            ask_underwater(Underwater),
            ((Underwater == yes) ->
              (
                ask_ferner(Ferner),
                Fruit = no
              ) ; (ask_fruit(Fruit))),
              Life = yes,
              Vehicle = no,
              Mammal = no,
              Water = no,
              Friend = no
            )
          )
        )
      )
    )
  ),
  % It worked though.
  % It worked though.
  report(Thing, Type, Life, Mammal, Vehicle, Water, Underwater, Ferner, Fruit, Friend)
).

% Report Yes or No if the item is matched properly.
report(Thing, Type, Life, Mammal, Vehicle, Water, Underwater, Ferner, Fruit, Friend) :-
  write(Thing),
  write(Type),
  write(Life),
  write(Mammal),
  write(Vehicle),
  write(Water),
  write(Underwater),
  write(Ferner),
  write(Fruit),
  write(Friend),
  type(Thing, Type),
  ((Life        == yes) -> alive(Thing);        \+alive(Thing)),
  ((Mammal      == yes) -> mammal(Thing);       \+mammal(Thing)),
  ((Water       == yes) -> water(Thing);        \+water(Thing)),
  ((Underwater  == yes) -> underwater(Thing);   \+underwater(Thing)),
  ((Vehicle     == yes) -> vehicle(Thing);      \+vehicle(Thing)),
  ((Ferner      == yes) -> ferner(Thing);       \+ferner(Thing)),
  ((Fruit       == yes) -> fruit(Thing);        \+fruit(Thing)),
  ((Friend      == yes) -> friend(Thing);       \+friend(Thing)).

% vim: filetype=prolog:
