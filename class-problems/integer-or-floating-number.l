%{
#include<stdio.h>

// "-?" means "-" is optional
// "\\." matches the actual dot character (since dot has a special meaning in regex)
// "[0-9]+" means one or more digits
// "[0-9]*" means zero or more digits
// INT pattern matches optional '-' followed by one or more digits (integer)
// FLOAT pattern matches optional '-' followed by zero or more digits, followed by a dot, and then zero or more digits (floating point number)

/* FLOAT (-?[0-9]*\.[0-9]+)|(-?[0-9]+\.[0-9]*)
So what does it mean?

Let’s break it just once more for confidence:

(-?[0-9]*\.[0-9]+)

    optional -

    zero or more digits before the dot

    dot

    at least one digit after the dot
    💡 Handles: .5, -.9, 0.3

(-?[0-9]+\.[0-9]*)

    optional -

    at least one digit before the dot

    dot

    zero or more digits after
    💡 Handles: 5., -7., 100.

Combining both with | lets you support both types!

*/
%}

INT -?[0-9]+
FLOAT ((-?[0-9]*\.[0-9]+)|(-?[0-9]+\.[0-9]*))

%%

{FLOAT} {
    printf("FLOAT === %s\n", yytext);  
}

{INT} {
    printf("INT === %s\n", yytext);    
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
