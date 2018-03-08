#include <stdio.h>

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
