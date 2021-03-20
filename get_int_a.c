#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int *to_i_a(char from[], int to[], int f_size);

int main(void) {
  char input_tmp[32];
  int input_size = atoi(fgets(input_tmp, 32, stdin));
  char *input;
  int *target;
  input = (char *)malloc(input_size * 2 * sizeof(char));
  target = (int *)malloc(input_size * sizeof(int));
  fgets(input, input_size * 2, stdin);
  to_i_a(input, target, input_size * 2);
  for (int i = 0; i < input_size; i++) {
    printf("%d ", target[i]);
  }
  free(input);
  /* 処理 */




  /* 結果 */
  free(target);
  printf("");
}

int *to_i_a(char from[], int to[], int f_size) {
  int tmp_size = 12;
  char *tmp;
  tmp = (char *)malloc(tmp_size * sizeof(char));
  char chr;
  int to_pt = 0;
  int tm_pt = 0;

  for (int i = 0; i < f_size; i++) {
    chr = from[i];
    if (chr >= '0' && chr <= '9') {
      tmp[tm_pt++] = chr;
    } else if (tmp[0] != '\0') {
      tmp[tm_pt] = '\0';
      to[to_pt++] = atoi(tmp);
      tmp[0] = '\0';
      tm_pt = 0;
    }
  }

  free(tmp);
  return to;
}
