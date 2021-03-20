#include <stdio.h>
#include <stdlib.h>

int scope_judge(int scop);
int skip_check(int move_pt);
void next_set_pts(int move_pt, int scope);
int scores_sum(int scope);
int index_int(int n, int array[], int size);
int cmpnum(const void * n1, const void * n2);

int size, l_idx;
int scores[100];
int pts[100];

int main(void) {
  char tmp_input[7];
  size = atoi(fgets(tmp_input, 7, stdin));
  l_idx = size - 1;
  int result[10100] = {0};
  int add_tmp, move_pt, r_pt = 1;
  for (int i = 0; i < size; i++) {
    scores[i] = atoi(fgets(tmp_input, sizeof(tmp_input), stdin));
    pts[i] = i;
  }

  for (int scope = l_idx; scope >= 0; scope--) {
    do {
      for (move_pt = scope; pts[move_pt] < size; pts[move_pt]++) {
        if (skip_check(move_pt)) continue;
        add_tmp = scores_sum(scope);
        if (index_int(add_tmp, result, r_pt) == -1) result[r_pt++] = add_tmp;
      }
      do {
        move_pt = scope_judge(scope);
        if (move_pt < 0) break;
        next_set_pts(move_pt, scope);
      } while (skip_check(move_pt));
    } while (move_pt >= 0);
  }

  qsort(result, sizeof(result) / sizeof(result[0]), sizeof(int), cmpnum);
  for (int i = 0; i < r_pt; i++) {
    printf("%d\n", result[i]);
  }

  return 0;
}

int scope_judge(int scope) {
  int i;
  for (i = 0; i <= scope; i++) {
    if (pts[scope - i] < l_idx - i) return scope - i;
  }
  return -1;
}

int skip_check(int move_pt) {
  if (pts[move_pt] >= size) return 0;
  int pt = pts[move_pt];
  int check_score = scores[pt];
  for (int i = pt + 1; i < size; i++) {
    if (scores[i] == check_score) return 1;
  }

  int pt_sum = 0;
  for (int i = 0; i <= move_pt; i++) {
    pt_sum += scores[pts[i]];
  }

  for (int i = 0; i < size; i++) {
    if (scores[i] == pt_sum) return 1;
  }
  return 0;
}

void next_set_pts(int move_pt, int scope) {
  int next_pt = pts[move_pt] + 1;
  for (int i = move_pt; i <= scope; i++) {
    pts[i] = next_pt + i - move_pt;
  }
}

int scores_sum(int scope) {
  int ret = 0;
  for (int i = 0; i <= scope; i++) {
    ret += scores[pts[i]];
  }
  return ret;
}

int index_int(int n, int array[], int size) {
  for (int i = 0; i < size; i++) {
    if (array[i] == n) return i;
  }
  return - 1;
}

int cmpnum(const void * n1, const void * n2) {
	if (*(int *)n1 > *(int *)n2) {
		return 1;
	} else if (*(int *)n1 < *(int *)n2) {
		return -1;
	} else {
		return 0;
	}
}


/*
# 方針
- 比較回数を減らすため、大きい方から計算していく

# 飛ばしていい時
- 起点の数値が、以降のidxのscoresに他にあるとき
- 起点の合計がscoresにあるとき
*/
