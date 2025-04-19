%{
/*
2. Write a Flex program that counts the number of words and numbers in a string. [Use "end" as the terminating command, and it will not be counted].

Test Input 1:
cat 42 dog 7
end

Test Output 1:
Word: 2
Number: 2

Test Input 2:
99 bottles end

Test Output 2:
Word: 1
Number: 1
*/

#include<stdio.h>

int word_count = 0, numerical_count = 0;

%}

%%

"end" {
    return 0;
}

[0-9]+ {
    numerical_count++;
}
[a-zA-Z]+ {
    word_count++;
}

.|\n ; 

%%

int yywrap(){
    return 1;
}
int main(){
    yylex();

    printf("Word: %d\n", word_count);
    printf("Number: %d\n", numerical_count);

    return 0;
}