(*  Performs a single pass of merging on a list of lists.
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

(* Never write code twice. *)
use "merge.sml";

(* Performs one pass of merging on a list of lists *)
fun merge_pass(nil)      = nil                            (* Empty case       *)
  | merge_pass(x::nil)   = [x]                            (* One element case *)
  | merge_pass(x::y::xs) = [merge(x, y)] @ merge_pass(xs) (* >=2 elements     *)

(* Initial test case *)
val list_1 = [[24], [39], [50], [28], [50], [1], [15], [1], [35], [40], [9],
              [ 8], [25], [ 1], [ 2]];

(* Returns [[24, 39], [28, 50], [1, 50], [1, 15],
 *          [35, 40],   [8, 9], [1, 25],     [2]]
 *)
val list_2 = merge_pass(list_1);

(* Returns [[24,28,39,50], [1, 1, 15, 50], [8, 9, 35, 40], [1, 2, 25]] *)
merge_pass(list_2);
