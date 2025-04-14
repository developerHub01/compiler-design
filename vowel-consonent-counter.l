%{
#include<stdio.h>

int vowel_count = 0, consonent_count = 0;
%}

%%

[aAeEiIoOuU] {vowel_count++;}
[b-dB-Df-hF-Hj-nJ-Np-tP-Tv-zV-Z] {consonent_count++;}

[^a-zA-Z\n] {
    if(yytext[0] == ' '){
        printf("Not a valid character: Space\n");
    }else {
        printf("Not a valid character: %c\n", yytext[0]);
    }
}

\n {
    printf("vowel = %d, consonent = %d\n", vowel_count, consonent_count);
    vowel_count = 0, consonent_count = 0;
}


%%

int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}