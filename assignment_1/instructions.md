# Part 1
Create a Fortran program which calculates the optimal cylindrical volume given a
surface area of source material.

The program should include:
1. Input read from the user
2. Four arrays for radii, height, surface area, and volume.
  * Use functions to calculate the height, surface area, and volume.
3. Output a table with the calculated radii, height, area, and volume.
4. Output the values which produce the maximum cylindrical volume.

# Part 2
Write a second Fortran program to demonstrate the static nature of local
variables.

The program should include:
1. A function which has the following behavior:
  * Takes a integer as a parameter
  * Declares a local integer variable using Fortan 77's old style for
    initialization
  * Prints the value of both variables
  * Modifies the variables
2. A mechanism to call the function 10 times with different parameter values.
