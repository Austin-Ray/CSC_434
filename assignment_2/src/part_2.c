#include <stdio.h>

long long fact(long long n);

int main() {
  fact(6);

  return 0;
}

long long fact(long long n) {
  printf("Address of n = %p,\tValue of n = %lld\n", (void *)&n, n);

  if (n == 1)
    return 1;

  return fact(n - 1);
}

