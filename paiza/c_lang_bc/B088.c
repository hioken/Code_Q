#include <stdio.h>

int dir_ch(int co, int *dir);
int check(int log_c, int p_y, int p_x);

int loger[256][2] = {{0,0}};

int main(void){
  int column_num, row_num, log_c = 0, dir = 0;
  fscanf(stdin, "%d %d", &column_num, &row_num);

  int point[] = {0,0};
  char a[100];
  char map[100][100];
  for (int i = -1; i < column_num; i++) {
    if (i < 0) {
      fgets(a, sizeof(map[i]), stdin);
    } else {
      fgets(map[i], sizeof(map[i]), stdin);
    }
  }

  int counter = 3;
  char cell;

  while (counter) {
    cell = 'a';

    switch (dir) {
      case 0:
        if (point[1] + 1 < row_num) cell = map[point[0]][point[1] + 1];
        if (cell != '.') {
          counter = dir_ch(counter, &dir);
          break;
        } else {
          point[1] = point[1] + 1;
          if (check(log_c, point[0], point[1])) {
            point[1] = point[1] - 1;
            printf("%d %d", point[0], point[1]);
            return 0;
          }
          loger[log_c][0] = point[0];
          loger[log_c][1] = point[1];
          log_c++;
          counter = 3;
          break;
        }
      case 1:
        if (point[0] + 1 < column_num) cell = map[point[0] + 1][point[1]];
        if (cell != '.') {
          counter = dir_ch(counter, &dir);
          break;
        } else {
          point[0] = point[0] + 1;
          if (check(log_c, point[0], point[1])) {
            point[0] = point[0] - 1;
            printf("%d %d", point[0], point[1]);
            return 0;
          }
          loger[log_c][0] = point[0];
          loger[log_c][1] = point[1];
          log_c++;
          counter = 3;
          break;
        }
      case 2:
        if (point[1] - 1 >= 0) cell = map[point[0] + 1][point[1]];
        if (cell != '.') {
          counter = dir_ch(counter, &dir);
          break;
        } else {
          point[1] = point[1] - 1;
          if (check(log_c, point[0], point[1])) {
            point[1] = point[1] + 1;
            printf("%d %d", point[0], point[1]);
            return 0;
          }
          loger[log_c][0] = point[0];
          loger[log_c][1] = point[1];
          log_c++;
          counter = 3;
          break;
        }
      case 3:
        if (point[1] - 1 >= 0) cell = map[point[0] + 1][point[1]];
        if (cell != '.') {
          counter = dir_ch(counter, &dir);
          break;
        } else {
          point[0] = point[0] - 1;
          if (check(log_c, point[0], point[1])) {
            point[0] = point[0] + 1;
            printf("%d %d", point[0], point[1]);
            return 0;
          }
          loger[log_c][0] = point[0];
          loger[log_c][1] = point[1];
          log_c++;
          counter = 3;
          break;
        }
    }
  }

  printf("%d %d", point[1], point[0]);

  return 0;
}



int dir_ch(int co, int *dir) {
  int add;
  add = (co < 3 ? 2 : 1);
  *dir = (*dir + add) % 4;
  return co - 1;
}

int check(int log_c, int p_y, int p_x) {
  for (int i = 0; i < log_c; i++) {
    if (loger[i][0] == p_y && loger[i][1] == p_x) return 1;
  }
  return 0;
}
