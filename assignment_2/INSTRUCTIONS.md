# Part 1

Create the following data:
1) Parameters
2) Local variables
3) Local static variables
4) Global variables
5) Dynamically allocated data (using malloc or calloc)

In addition to data of the above types, create and discover the
addresses of:

1) Functions (including main())
2) Literals

Draw a diagram of the process' logical memory (like in the picture above) and
show approximately where each variable resides. Include the addresses and
relative ordering of the stack.

# Part 2

Implement a recursive factorial to demonstrate the addressing of
recursive function. At each instance of the function, print the
parameter's address. Use 6 as the initial value.

Draw a diagram showing the process' stack through the call sequence,
including return value, return location, static link, dynamic link, and
local variables. This diagram should contain the addresses (in hex) of
the parameter and its value.

# Part 3

Create a 3-dimensional array of doubles of size 4x2x3. Use 3 nested loops to
print the address of each location along with array subscripts.

Create a diagram of all 24 elements of the array. Determine formula to calculate
memory addresses. Additionally, does C use row-major or column major ordering?
