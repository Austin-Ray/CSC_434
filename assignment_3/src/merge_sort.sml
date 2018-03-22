(*  Implementation of merge sort in SML.
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

(* Never write code twice or three times in case of merge. *)
use "merge_pass.sml";

fun merge_sort(nil)     = nil                           (* Empty case         *)
  | merge_sort(x::nil)  = x                             (* One list remaining *)
  | merge_sort(x::xs)   = merge_sort(merge_pass(x::xs)) (* Needs another pass *)

(* Initial test case *)
val list_1 = [[24], [39], [50], [28], [50], [1], [15], [1], [35], [40], [9],
              [ 8], [25], [ 1], [ 2]];


(* Returns [1, 1, 1, 2, 8, 9, 15, 24, 25, 28, 35, 39, 40, 50, 50] *)
merge_sort(list_1);
