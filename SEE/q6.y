%{
#include<stdio.h>
#include<stdlib.h>
int res = 0;    
%}

%token id num

%%
stmt: expr {res=$$;}
expr: expr'+''+' {$$=$1+1; printf("postfix increment");}
    | expr'-''-' {$$=$1-1; printf("postfix decrement");}
    | expr '+' expr {$$=$1+$3; printf("plus performed\n");}
    | expr '-' expr {$$=$1-$3; printf("minus performed\n");}
    | expr '*' expr {$$=$1*$3; printf("multiplication performed\n");}
    | expr '/' expr {$$=$1/$3; printf("division performed\n");}
    | '('expr')' {$$=$2; printf("brackets detected!\n");}
    | '+''+'expr {$$=$3+1; printf("prefix increment performed");}
    | '-''-'expr {$$=$3-1; printf("prefix decrement performed");}
    | expr '+' {printf("Error: operand missing\n"); exit(1);}
    | expr '-' {printf("Error: operand missing\n"); exit(1);}
    | expr '*' {printf("Error: operand missing\n"); exit(1);}
    | expr '/' {printf("Error: operand missing\n"); exit(1);}
    | id
    | num 
    ;
%%

void main(){
    printf("\nEnter the expression: ");
    yyparse();
    printf("\nResult is: %d\n", res);
    exit(0);
}

void yyerror(){
    printf("Invalid!\n");
    exit(0);
}

