%{
    #include<stdio.h>
    #include<stdlib.h>
    int res=0;
%}

%token type id

%%
D: T ' ' L {res=1;};
T: type;
L: L ',' id;
L: id;

%%

int main(){
    printf("Enter string: ");
    yyparse();
    if(res==1){
        printf("string parsed succesfully!\n");
    }else{
        printf("string cannot be parsed by grammar\n");
    }
    
    exit(0);
}

void yyerror(){
    printf("string cannot be parsed by grammar\n");
    exit(1);
}