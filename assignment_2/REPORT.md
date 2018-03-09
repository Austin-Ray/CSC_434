# Part 1

| Variable                      | Address        |
|-------------------------------|----------------|
| main() function               | 0x5592b104174a |
| ...                           | ...            |
| demo_func() function          | 0x5592b1041790 |
| ...                           | ...            |
| data of dynamic int variable  | 0x5592b1642270 |
| ...                           | ...            |
| dynamic double variable       | 0x5592b1642290 |
| ...                           | ...            |
| data of dynamic char variable | 0x5592b16422b0 |
| ...                           | ...            |
| global int variable           | 0x5592b1243048 |
| global double variable        | 0x5592b1243050 |
| global char variable          | 0x5592b1243058 |
| static int variable           | 0x5592b124305c |
| static double variable        | 0x5592b1243060 |
| static char variable          | 0x5592b1243068 |
| ...                           | ...            |
| double parameter              | 0x7ffe190d4f60 |
| char parameter                | 0x7ffe190d4f68 |
| integer parameter             | 0x7ffe190d4f6c |
| local char variable           | 0x7ffe190d4f7b |
| local int variable            | 0x7ffe190d4f7c |
| local double variable         | 0x7ffe190d4f80 |
| dynamic int variable          | 0x7ffe190d4f88 |
| dynamic double variable       | 0x7ffe190d4f90 |
| dynamic char variable         | 0x7ffe190d4f98 |
| string literal                | 0x7ffe190d4fa0 |
|-------------------------------|----------------|

# Part 2

| Label             | Actual Stack   |
|-------------------|----------------|
| Parameter n       | 1              |
| Parameter address | 0x7fff16044ae8 |
| Dynamic link      |                |==============>+
| Static link       |                |---------------‖---------------->+
| Return location   | 5              |               ‖                 |
| Return value      | 1              |               V                 |
|-------------------|----------------|<==============+                 |
| Parameter n       | 2              |                                 |
| Parameter address | 0x7fff16044b08 |                                 |
| Dynamic link      |                |==============>+                 |
| Static link       |                |---------------‖---------------->+
| Return location   | 4              |               ‖                 |
| Return value      | 2              |               V                 |
|-------------------|----------------|<==============+                 |
| Parameter n       | 3              |                                 |
| Parameter address | 0x7fff16044b28 |                                 |
| Dynamic link      |                |==============>+                 |
| Static link       |                |---------------‖---------------->+
| Return location   | 3              |               ‖                 |
| Return value      | 6              |               V                 |
|-------------------|----------------|<==============+                 |
| Parameter n       | 4              |                                 |
| Parameter address | 0x7fff16044b48 |                                 |
| Dynamic link      |                |==============>+                 |
| Static link       |                |---------------‖---------------->+
| Return location   | 2              |               ‖                 |
| Return value      | 24             |               V                 |
|-------------------|----------------|<==============+                 |
| Parameter n       | 5              |                                 |
| Parameter address | 0x7fff16044b68 |                                 |
| Dynamic link      |                |==============>+                 |
| Static link       |                |---------------‖---------------->+
| Return location   | 1              |               ‖                 |
| Return value      | 120            |               V                 |
|-------------------|----------------|<==============+                 |
| Parameter n       | 6              |                                 |
| Parameter address | 0x7fff16044b88 |                                 |
| Dynamic link      |                |==============>+                 |
| Static link       |                |---------------‖---------------->|
| Return location   | System exit    |               ‖                 |
| Return value      | 720            |               V                 V
|-------------------|----------------|<--------------------------------+

# Part 3
C uses row-major order

| Row-major order | Memory Address |
|-----------------|----------------|
| array[0][0][0]  | 0x7fff82920170 |
| array[0][0][1]  | 0x7fff82920178 |
| array[0][0][2]  | 0x7fff82920180 |
| array[0][1][0]  | 0x7fff82920188 |
| array[0][1][1]  | 0x7fff82920190 |
| array[0][1][2]  | 0x7fff82920198 |
| array[1][0][0]  | 0x7fff829201a0 |
| array[1][0][1]  | 0x7fff829201a8 |
| array[1][0][2]  | 0x7fff829201b0 |
| array[1][1][0]  | 0x7fff829201b8 |
| array[1][1][1]  | 0x7fff829201c0 |
| array[1][1][2]  | 0x7fff829201c8 |
| array[2][0][0]  | 0x7fff829201d0 |
| array[2][0][1]  | 0x7fff829201d8 |
| array[2][0][2]  | 0x7fff829201e0 |
| array[2][1][0]  | 0x7fff829201e8 |
| array[2][1][1]  | 0x7fff829201f0 |
| array[2][1][2]  | 0x7fff829201f8 |
| array[3][0][0]  | 0x7fff82920200 |
| array[3][0][1]  | 0x7fff82920208 |
| array[3][0][2]  | 0x7fff82920210 |
| array[3][1][0]  | 0x7fff82920218 |
| array[3][1][1]  | 0x7fff82920220 |
| array[3][1][2]  | 0x7fff82920228 |
|-----------------|----------------|

Formula:

High-level formula:
start position + ((i\*j\*k) + (i*j) + (i)) * size of data type

C Code for getting memory address:
```c
long start_pos = &array[0][0][0]; // First memory address in the array
long mem_loc = start_pos + ((i*j*k) + (j*k) + k) * sizeof(int);
printf("%o", mem_loc);
```

