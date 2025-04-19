%{
/*
3. Write a Flex program that accepts any string with "pq" or "PQ" anywhere in the string. [Use "end" as the terminating command, and it will not be counted].

Test Input 1:
Cat_pq_Dog
Somewhere_in_the_PQ
Somewhere_in_the_pQ
end

Test Output 1:
Valid
Valid
Invalid


*/

#include<stdio.h>


%}

%%

"end" {
    return 0;
}

.*(pq|PQ).* {
    printf("Valid\n");
}
.* {
    printf("Invalid\n");
}

.|\n ; 

%%

int yywrap(){
    return 1;
}
int main(){
    yylex();

    return 0;
}