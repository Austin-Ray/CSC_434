(*  Performs merge sort on a list of lists.
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

(* Only a fool types code multiple times *)
use "list_of_lists.sml";
use "merge_sort.sml";

fun merge_sort_driver(input) = merge_sort(list_of_lists(input));

val list_1 = [24, 39, 50, 28, 50, 1, 15, 1, 35, 40, 9, 8, 25, 1, 2];

merge_sort_driver(list_1);
