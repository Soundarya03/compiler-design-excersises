%{
    #include<stdio.h>
    #include<stdlib.h>
%}

%token id num equal

%%
s: l'='r
    | r;
l: '*'r
    |id 
    |num;
r: l
    ;
%%

void main(){
    printf("Enter string: ");
    yyparse();
    printf("string parsed succesfully!\n");
    exit(0);
}

void yyerror(){
    printf("string cannot be parsed by grammar\n");
    exit(1);
}