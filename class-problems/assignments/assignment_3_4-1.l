%{
/*
1. Write a Flex program that counts the numbers of Vowels, Consonants, and Numerical Values from given inputs. [Use "end" as the terminating command, and it will not be counted].

Test Input 1:
A big rabbit ran
across 150 miles of road.
end
Test Output 1:
Vowels = 12,
Consonants: 18,
Numerical values: 1

Test Input 2:

101aeiouAEIOUBCDFGHbcdfgh102
end
Test Output 2:
Vowels = 10,
Consonants: 12,
Numerical values: 2

*/

#include<stdio.h>

int vowel_count = 0, consonant_count = 0, numerical_count = 0;

%}

%%

"end" {
    return 0;
}

[0-9]+ {
    numerical_count++;
}
[aeiouAEIOU] {
    vowel_count++;
}
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z] {
    consonant_count++;
}

.|\n ; 

%%

int yywrap(){
    return 1;
}
int main(){
    yylex();

    printf("Vowels = %d,\n", vowel_count);
    printf("Consonants: %d,\n", consonant_count);
    printf("Numerical values: %d\n", numerical_count);

    return 0;
}