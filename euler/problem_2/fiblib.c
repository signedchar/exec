#include <stdio.h>

unsigned long long fib(int number) {

  unsigned long long frst, snd, acc;
  int i = 2;

  if (number <= 0)
    return 0;

  if (number == 1)
    return 1;

  frst = 0;
  snd = 1;

  for (i; i <= number; i++) {
    acc = frst + snd;
    frst = snd;
    snd = acc;
    printf("%llu\n", acc);
  }

  return acc;
}

int main() {
  unsigned long long result;

  result = fib(11);

  printf("\n");

  //printf("%llu\n", result);
}
