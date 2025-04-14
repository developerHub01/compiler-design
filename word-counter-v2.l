%{
#include<stdio.h>

int word_count = 0;
%}

%%

[a-zA-Z0-9]+ {
    word_count++;
}

[ \t] {}

. {}

\n {
    printf("word count = %d\n", word_count);
    word_count = 0;
}


%%

int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}