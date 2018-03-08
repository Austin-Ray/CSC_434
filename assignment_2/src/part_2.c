#include <stdio.h>

long long fact(long long n);

int main() {
  fact(6);

  return 0;
}

long long fact(long long n) {
  printf("Address of n = %p,\tValue of n = %lld\n", (void *)&n, n);

  // 1! and 0! are equal to 1.
  if (n < 2) return 1;

  return fact(n - 1);
}

