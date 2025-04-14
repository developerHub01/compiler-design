%{
    #include<stdio.h>
%}

%%
[0-9] {printf("Digit %c\n", yytext[0]);}
[a-zA-Z] {printf("Character %c\n", yytext[0]);}
[ \t] {printf("Space\n");}
. {printf("Other %c\n", yytext[0]);}
%%


int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}