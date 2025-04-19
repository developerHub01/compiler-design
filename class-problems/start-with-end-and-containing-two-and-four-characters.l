%{
/*
A flex program to identify string which starts with "end" and at least 2 character and at most 4 character in between them
*/

#include<stdio.h>

/*
START_WITH_END_AND_2_TO_4_CHARACTERS  ^end[a-zA-Z0-9]{2,4}$

Explanation:
    Regular Expression: ^end[a-zA-Z0-9]{2,4}$
        ^: Asserts the start of the string.
        end: Matches the literal string end.
        [a-zA-Z0-9]{2,4}: Matches between 2 and 4 characters that are either alphanumeric (letters or digits).
        $: Asserts the end of the string.

    Regular Expression: ^end.{2,4}$
        ^ → Start of the string
        end → Literal match of "end"
        .{2,4} → Matches any character (except newline) repeated 2 to 4 times
        $ → End of the string
*/
%}

START_WITH_END_AND_2_TO_4_CHARACTERS   ^end.{2,4}$

%%

{START_WITH_END_AND_2_TO_4_CHARACTERS} {
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