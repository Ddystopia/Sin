#include <math.h>
#include <stdio.h>
#include <stdlib.h>

extern double sin_c(double);

const double EPSILON = 1e-15;
void test();

int main(int argc, char** argv) {
  if (argc < 2)
    test();
  else
    printf("Tesed:\t%.20lf\nC:\t%.20lf\n", sin_c(atof(argv[1])),
        sin(atof(argv[1])));

  return 0;
}

void test() {
  printf("Testing segment [-10; 10] with step 0.01.\n");
  printf("Epsilon: %le\n", EPSILON);
  for (double i = -10; i <= 10; i += 0.01) {
  //for (int n = -1000; n <= 1000; n += 1) {
    double c = sin(i);
    double tested = sin_c(i);
    double diff = fabs(tested - c);
    if (diff > EPSILON) {
      printf("\n\033[1m\033[31mFailed\033[0m\n");
      printf(
          "N:\t%.2lf\
          \nDiff:\t%le\
          \nTested:\t%.29lf\
          \nC:\t%.29lf\n",
          i, diff, tested, c);
      exit(1);
    }
  }
  printf("\033[1m\033[32mSuccess\033[0m\n");
}
