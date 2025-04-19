%{
#include<stdio.h>

int number_count = 0, word_count = 0;
%}

NUMBER [0-9]+
WORD [a-zA-Z]+

%%
{NUMBER} {
    printf("number = %s\n", yytext);
    number_count++;
}
{WORD} {
    printf("word = %s\n", yytext);
    word_count++;
}

[ \t]+ {
    printf("Space\n");
}

. {}

\n {
    printf("\nnumber count = %d\n", number_count);
    printf("word count = %d\n", word_count);
}
%%

int yywrap() {
    return 1;
}
int main(){
    yylex();
    return 0;
}