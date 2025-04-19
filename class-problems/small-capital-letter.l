%{
#include<stdio.h>
%}

LOWER [a-z]
UPPER [A-Z]

%%

{LOWER} {
    printf("SMALL LETTER = %s\n", yytext);
    printf("*** SMALL LETTER = %c\n", yytext[0]);
}
{UPPER} {
    printf("CAPITAL LETTER = %s\n", yytext);
}

\n {
    printf("==============\n");
}

. {}

%%


int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}