%{
    #include<stdio.h>
    #include<stdlib.h>
%}

%token id

%%
s: s s'+'
    | s s'*'
    | '('s')' 
    | id
    ;
%%

void main(){
    printf("Enter the string: ");
    yyparse();
    printf("Parsed succesfully\n");
    exit(0);
}

void yyerror(){
    printf("Not accepted by the grammar\n");
    exit(1);
}