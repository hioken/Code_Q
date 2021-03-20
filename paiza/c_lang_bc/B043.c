#include <stdio.h>
int work(char *house);

int main(void){
  int y_len, x_len, x_p, y_p, dir = 0;
  fscanf(stdin, "%d %d", &y_len, &x_len);
  fscanf(stdin, "%d %d", &y_p, &x_p);
  char map[y_len + 1][x_len + 2];
  for (int i = 0; i < y_len + 1; i++ ) {
    if (i == 0) {
      fgets(map[0], sizeof(1), stdin);
    } else {
    fgets(map[i - 1], sizeof(map[0]), stdin);
    }
  }
  y_p--;
  x_p--;
  /* ここまで変数のセット */

  /* ここから処理 */
  while(0 <= x_p && x_p < x_len && 0 <= y_p && y_p < y_len) {
    dir = (dir + work(&map[y_p][x_p]) + 4) % 4;
    switch (dir) {
    case 1:
      x_p ++;
      break;
    case 2:
      y_p ++;
      break;
    case 3:
      x_p --;
      break;
    case 0:
      y_p --;
      break;
    default:
      return 1;
      break;
    }
  }
  /* ここまで処理 */

  /* ここから出力 */
  for (int i = 0; i < y_len; i++ ) {
    printf("%s", map[i]);
  }

  return 0;
}

int work(char *house) {
  if (*house == '.') {
    *house = '*';
    return 1;
  } else {
    *house = '.';
    return (-1);
  }
}

/*
  処理1
  貧富を判断して、mapの変換と移動方向(+-1)を決定
  処理2
  dirを考慮して移動
*/
