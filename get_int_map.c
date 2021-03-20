#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int *to_i_a(char from[], int to[], int f_size);
int get_map_size(char input[], int *row, int *column);

int main(void) {
  char input_tmp[8];
  int input_size = atoi(fgets(input_tmp, 8, stdin));
  char *input;
  input = (char *)malloc(input_size * 2 * sizeof(char));
  int map[input_size][input_size];
  for (int i = 0; i < input_size; i++){
    fgets(input, input_size * 2, stdin);
    to_i_a(input, map[i], input_size * 2);
  }
  for (int i = 0; i < input_size; i++) {
    for (int y = 0; y < input_size; y++) {
      printf("%d ", map[i][y]);
    }
    printf("\n");
  }
  free(input);
  /* 処理 */


  /* 結果 */
  printf("");
}

int *to_i_a(char from[], int to[], int f_size) {
  int tmp_size = 256;
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

/* 縦横別 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int *to_i_a(char from[], int to[], int f_size);

int main(void) {
  char input_tmp[8];
  int row, column;
  fgets(input_tmp, sizeof(input_tmp), stdin);
  get_map_size(input_tmp, *row, *column, )


  char *input;
  input = (char *)malloc(input_size * 2 * sizeof(char));
  int map[row][column];
  for (int i = 0; i < row; i++){
    fgets(input, column * 2, stdin);
    to_i_a(input, map[i], column * 2);
  }
  for (int i = 0; i < input_size; i++) {
    for (int y = 0; y < input_size; y++) {
      printf("%d ", map[i][y]);
    }
    printf("\n");
  }
  free(input);
  /* 処理 */


  /* 結果 */
  printf("");
}

int *to_i_a(char from[], int to[], int f_size) {
  int tmp_size = 256;
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
int get_map_size(char input[], int *row, int *column) {
  int tmp_size = 8;
  char *tmp;
  tmp = (char *)malloc(tmp_size * sizeof(char));
  char chr;
  int to_pt = 0;
  int tm_pt = 0;
  int flg = 1;

  for (int i = 0; i < tmp_size; i++) {
    chr = from[i];
    if (chr >= '0' && chr <= '9') {
      tmp[tm_pt++] = chr;
    } else if (tmp[0] != '\0') {
      tmp[tm_pt] = '\0';
      if (flg) {
        *row = atoi(tmp);
        flg = 0;
      } else {
        *column = atoi(tmp);
        break
      }
      tmp[0] = '\0';
      tm_pt = 0;
    }
  }

  free(tmp);
  return 0;
}
