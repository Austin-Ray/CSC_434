/*
 * Demonstrate how memory is allocated for an array in C.
 * Copyright (C) 2018  Austin D. Ray
 *
 * This program is free software: you can redistribute it and/or modify it
 * under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#include <stdio.h>

/**
 * Show how memory is mapped in an array.
 *
 * @return Exit code
 */
int main() {
  int d1 = 4;
  int d2 = 2;
  int d3 = 3;

  double array[d1][d2][d3];

  for (int i = 0; i < d1; i++) {
    for (int j = 0; j < d2; j++) {
      for (int k = 0; k < d3; k++) {
        printf("Memory location for (%d,%d,%d) = %p\n", i, j, k, (void *)(&array[i][j][k]));
      }
    }
  }

  return 0;
}
