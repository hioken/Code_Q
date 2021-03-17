#include <stdio.h>
int check(char hand[]);
int in_array(int check, int checked[]);

char poker[5][256] = {"NoPair", "OnePair", "ThreeCard", "FourCard", "TwoPair"};

int main(void) {
  char hand[5];
  int ret;
  fgets(hand, sizeof(hand), stdin);
  ret = check(hand);
  printf("%s", poker[ret]);
}

int check(char hand[]) {
  int i, j;
  char chr = '\0';
  int pair = 0;
  int flag = 0;
  int joker = 0;
  int checked[3] = {-1,-1,-1};
  int cp = 0;
  for (i = 0; i < 4 && flag < 2; i++) {
    if (in_array(i, checked)) {
      continue;
    } else if (hand[i] == '*') {
      joker++;
    } else {
      for (j = i + 1; j < 4 && i < 3; j++) {
        if (hand[i] == hand[j]) {
          if (flag == 0) {
            chr = hand[i];
            pair = 1;
            flag++;
            checked[cp++] = j;
          } else if (hand[i] == chr) {
            pair++;
            checked[cp++] = j;
          } else {
            flag++;
            break;
          }
        }
      }
    }
  }

  switch (flag) {
    case 2:
      return 4;
    default:
      return pair + joker;
  }
}

int in_array(int check, int checked[]) {
  for (int i = 0; i < sizeof(checked) / sizeof(checked[0]); i++) {
    if (checked[i] == check) return 1;
  }
  return 0;
}
