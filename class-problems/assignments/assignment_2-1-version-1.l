%{
/*
1. Write a Flex program that recognizes and prints "hello" and "world". Any other input should be marked as "Invalid".
Test Input:
hello
world
Flex
Test Output:
Valid
Valid
Invalid

*/

#include<stdio.h>
%}

%%

"hello" {
    printf("Valid\n");
}
"world" {
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