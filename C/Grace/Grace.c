/*
Comment outside
*/
#include <stdio.h>
#define S "/*%cComment outside%c*/%c#include <stdio.h>%c#define S %c%s%c%c#define F(x) int main(){FILE *fp=fopen(%cGrace_kid.c%c,%cw%c);fprintf(fp,S,10,10,10,10,34,S,34,10,34,34,34,34,10,10);fclose(fp);}%cF(x)%c"
#define F(x) int main(){FILE *fp=fopen("Grace_kid.c","w");fprintf(fp,S,10,10,10,10,34,S,34,10,34,34,34,34,10,10);fclose(fp);}
F(x)
