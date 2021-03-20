int index_int(int n, int *array, int size);

int index_int(int n, int *array, int size) {
  for (int i = 0; i < size; i++) {
    if (array[i] == n) return i;
  }
  return - 1;
}
