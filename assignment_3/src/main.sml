(*  Performs merge sort on randomly generated list of 50 items.
 *  Copyright (C) 2018  Austin Ray

 *  This program is free software: you can redistribute it and/or modify it
 *  under the terms of the GNU Affero General Public License as published by the
 *  Free Software Foundation, either version 3 of the License, or (at your
 *  option) any later version.

 *  This program is distributed in the hope that it will be useful, but WITHOUT
 *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 *  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License
 *  for more details.

 *  You should have received a copy of the GNU Affero General Public License
 *  along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *)

(* Import the driver *)
use "merge_sort_driver.sml";

(* This seed is atrocious, but we're not evaluating my random skills *)
val randSeed = Random.rand(1, 1)

(* Get an integer input from the user.
 *
 * Written to have an interchange-able message because I am lazy.
 *)
fun get_input(msg : string) = (
  print("Please enter a " ^ msg ^ " number: ");
  let
    val input  = valOf(TextIO.inputLine TextIO.stdIn)
    val i      = valOf(Int.fromString input)
  in
    i
  end
);

(*
 * Recursively create a list of size populated with random integers.
 *
 * Takes in the number to generate, the list to put random values, min, and max.
 *)
fun random_list(0, rand_list, min, max) = rand_list
  | random_list(n, rand_list, min, max) =
        random_list(n - 1, rand_list @ [Random.randRange(min, max) randSeed], min, max)

(*
 * Prints a list with each element joined by a comma.
 *
 * This helper function fills the gap of translating a int list to a string.
 *)
fun printIntList(xs) =
  print("[" ^ (String.concatWith ", " (map Int.toString xs)) ^ "]\n");

fun main() =
  let
    val min = get_input("min")
    val max = get_input("max")

    val list_1      = random_list(50, [], min, max)
    val merge_list  = merge_sort_driver(list_1)
 in (
    print("Min: "^ (Int.toString(min)) ^"\n"),
    print("Max: "^ (Int.toString(max)) ^"\n"),

    printIntList(list_1),
    printIntList(merge_list)
  ) end

val _ = main()
