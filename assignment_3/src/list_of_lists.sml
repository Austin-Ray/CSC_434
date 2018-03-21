(*  Takes of list of items and returns a list of lists each containing one item.
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
fun list_of_lists(nil) = nil
  | list_of_lists(x::xs) = [x]::list_of_lists(xs);

val list = [24, 39, 50, 28, 50, 1, 15, 35, 40, 9, 8, 25, 1, 2];

list_of_lists(list);
