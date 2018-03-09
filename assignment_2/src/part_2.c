/*
 * Demonstrate how memory is allocated within a recursive function in C.
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
 * Compute a factorial
 *
 * This function is to demonstrate how memory is allocated in a recursively
 *
 * @param  Number of iterations for a factorial.
 */
long long fact(long long n);

/**
 * Entry point in the program
 *
 * @return  Exit code
 */
int main() {
  fact(6);

  return 0;
}

/* !copydoc fact() */
long long fact(long long n) {
  printf("Address of n = %p,\tValue of n = %lld\n", (void *)&n, n);

  // 1! and 0! are equal to 1.
  if (n < 2) return 1;

  return n * fact(n - 1);
}

