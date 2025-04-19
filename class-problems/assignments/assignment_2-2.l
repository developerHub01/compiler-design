%{
/*
2. Write a Flex program that recognizes +, -, *, and / operators and prints their names, otherwise print, 'Invalid Input'.
Test Input:
+
-
*
/
$
Test Output:
Addition operator
Subtraction operator
Multiplication operator
Division operator
Invalid Input

*/

#include<stdio.h>
%}

%%

"+" {
    printf("Addition operator\n");
}
"-" {
    printf("Subtraction operator\n");
}
"*" {
    printf("Multiplication operator\n");
}
"/" {
    printf("Division operator\n");
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