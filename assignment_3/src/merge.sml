(*  Merges two sorted lists into a third sorted list.
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

(* Merge two sorted lists into a third sorted list *)
fun merge(list_1, nil) = list_1                 (* Handle empty list_2       *)
  | merge(nil, list_2) = list_2                 (* Handle empty list_1       *)
  | merge(list_1 as x::xs, list_2 as y::ys) =   (* Alias list_1 and list_2   *)
        if    x < y then  x::merge(xs, list_2)  (* Sort based on value       *)
        else              y::merge(list_1, ys)

(* Test cases *)
val list_1 = [1, 1, 9, 28];
val list_2 = [1, 2, 8, 15, 24, 39, 50];

(* Outputs [1, 1, 1, 2, 8, 9, 15, 24, 28, 39, 50 *)
merge(list_1, list_2);
