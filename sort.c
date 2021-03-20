int cmpnum(const void * n1, const void * n2) {
	if (*(int *)n1 > *(int *)n2) {
		return 1;
	} else if (*(int *)n1 < *(int *)n2) {
		return -1;
	} else {
		return 0;
	}
}
