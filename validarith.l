%{
    #include<stdio.h>
    int lineCount = 0;
%}
operator [+\-*/]
number [0-9]+
identifier [a-zA-Z_][a-zA-Z0-9_]*
expression ({identifier}|{number})({operator}({identifier}|{number}))?

%%

\n {lineCount++;}
{identifier}"="{expression}";" {ECHO; printf(" Valid arithmetic expression at %d\n", lineCount);}
{expression}";" {ECHO; printf(" Invalid arithmetic expression at %d : lvalue expected\n", lineCount);}
{number}"="{expression}";" {ECHO; printf(" Invalid arithmetic expression at %d : lvalue invalid \n", lineCount);}
{identifier}"="";" {ECHO; printf(" Invalid arithmetic expression at %d : rvalue expected \n", lineCount);}
. ;

%%

int main(int argc, char* argv[]){
    if(argc<2){
        printf("Too few arguments");
    }

    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
}