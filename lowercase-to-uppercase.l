%{
#include<stdio.h>
#include<ctype.h>

int is_upper = -1;
%}

/*
first up/low Enter
if up then toupper 
if low tolower
else warning
*/

%%

[uU][pP]\n {
    // to make sure that it 
    if(is_upper != 1){
        is_upper = 1;
    }
}
[lL][oO][wW]\n {
    if(is_upper != 0){
        is_upper = 0;
    }
}

[a-zA-Z] {
    if(is_upper == -1) return printf("Invalid\n");

    char ch = yytext[0];
    if(is_upper == 1){
        ch = toupper(ch);
    }
    if(is_upper == 0){
        ch = tolower(ch);
    }
    printf("%c", ch);
}

. {
    printf("%c", yytext[0]);
}

\n {
    printf("\n==================\n");
    is_upper = -1;
}

%%

int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}