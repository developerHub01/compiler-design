%{
/*
A flex program to identify string which starts with  "end"  and at least one alphabet (uppercase/lowercase)
*/

#include<stdio.h>
%}

START_WITH_END_AND_ALPHABET ^end.*[a-zA-Z]+.*

%%

{START_WITH_END_AND_ALPHABET} {
    printf("Valid\n");
}
.* {
    printf("Invalid\n");
}

%%

int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}