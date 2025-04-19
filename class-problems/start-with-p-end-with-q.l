%{
/*
A flex program that starts with a 'p' and ends with a 'q'
*/

#include<stdio.h>


/*

Regular Expression:
    ^: Anchors the match to the beginning of the string.
    p: Matches the literal character 'p'.
    .*: Matches zero or more of any character between 'p' and 'q'.
    q: Matches the literal character 'q'.
    $: Anchors the match to the end of the string.
*/
%}

START_WITH_P_END_WITH_Q  ^p.*q$

%%

{START_WITH_P_END_WITH_Q} {
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