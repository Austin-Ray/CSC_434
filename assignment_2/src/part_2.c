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

  return fact(n - 1);
}

