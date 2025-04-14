%{
#include<stdio.h>
int word_count = 0;
int current_word_length = 0;
%}

%%

[a-zA-Z0-9] {
    current_word_length++;
}

[ \t] {
    if(current_word_length){
        word_count++;
        current_word_length = 0;
    }
}

. {}

\n {
     if(current_word_length){
        word_count++;
    }
    printf("word count = %d\n", word_count);
    current_word_length = 0;
    word_count = 0;
}


%%

int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}