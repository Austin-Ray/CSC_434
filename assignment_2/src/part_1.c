#include <stdlib.h>
#include <stdio.h>

/**
 * A demo function to isolate all the address printing, except for the main()
 *
 * This function is used primarily for containing the printing code, but also to
 * show how parameter are allocated onto the stack.
 *
 * @param   An integer parameter
 * @param   A double parameter
 * @param   A char parameter
 */
void demo_func(int, double, char);

int     global_int    = 1;
double  global_double = 1.0;
char    global_char   = 'c';

/**
 * Entry point in the program
 *
 * @return  Exit code
 */
int main() {
  // This causes my Makefile to emit a warning because this is undefined
  // behavior in ISO C. All research indicates that there is no safe way to
  // print a function pointer, only data pointers.
  printf("Address of main() function = %p\n", main);

  demo_func(1, 1.0, '1');

  return 0;
}

/*! @copydoc demo::function() */
void demo_func(int i, double d, char c) {
  // This suffers from the same warning as the previous function pointer noted
  // within the main() function.
  printf("Address of demo_func() function = %p\n", demo_func);

  // Declare local variables
  int    loc_int    = 1;
  double loc_dbl    = 1.0;
  char   loc_char   = 'c';

  // Declare dynamic variables
  int*     dyn_int  = (int *)    malloc(sizeof(int));
  double*  dyn_dbl  = (double *) malloc(sizeof(double));
  char*    dyn_char = (char *)   malloc(sizeof(char));

  // Declare static variables
  static int    stat_int = 1;
  static double stat_dbl = 1.0;
  static char   stat_char = '1';

  // The token string literal
  char*   str_lit = "This is a string literal";

  // Print the parameters
  printf("Address of integer parameter = %p\n", (void *)(&i));
  printf("Address of double parameter = %p\n",  (void *)(&d));
  printf("Address of char parameter = %p\n",    (void *)(&c));

  // Print local variables
  printf("Address of local int variable = %p\n",      (void *)(&loc_int));
  printf("Address of local double variable = %p\n",   (void *)(&loc_dbl));
  printf("Address of local char variable = %p\n",     (void *)(&loc_char));

  // Print static variables
  printf("Address of static int variable = %p\n",     (void *)(&stat_int));
  printf("Address of static double variable = %p\n",  (void *)(&stat_dbl));
  printf("Address of static char variable = %p\n",    (void *)(&stat_char));

  // Print static variables
  printf("Address of global int variable = %p\n",     (void *)(&global_int));
  printf("Address of global double variable = %p\n",  (void *)(&global_double));
  printf("Address of global char variable = %p\n",    (void *)(&global_char));

  // Print dynamic variables
  printf("Address of dynamic int variable = %p\n",    (void *)(&dyn_int));
  printf("Address of dynamic double variable = %p\n", (void *)(&dyn_dbl));
  printf("Address of dynamic char variable = %p\n",   (void *)(&dyn_char));

  printf("Data address of data of dynamic int variable = %p\n",   (void *)dyn_int);
  printf("Data address of dynamic double variable = %p\n",        (void *)dyn_dbl);
  printf("Data address of data of dynamic char variable = %p\n",  (void *)dyn_char);

  // Print String literal
  printf("Address of string literal = %p\n", (void *)(&str_lit));

  // Get rid of the dynamically allocated memory.
  free(dyn_int);
  free(dyn_dbl);
  free(dyn_char);
}
