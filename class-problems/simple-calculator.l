%{
#include<stdio.h>

int result = 0;
char current_operation = '+';
%}

PLUS "+"
MINUS "-"

%%

[0-9]+ {
    int number = atoi(yytext);
    if(current_operation == '+') result += number;
    else if(current_operation == '-') result -= number;
}
[+-] {
    printf("Operation = %c\n", yytext[0]);
    current_operation = yytext[0];
}

\n {
    printf("result = %d\n", result);
    current_operation = '+';
    result = 0;
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