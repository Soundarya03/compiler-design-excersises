%{
    #include<stdio.h>
    #include "y.tab.h"
    extern int yylval;    
%}

%%
[a] {return id;}
[\t] {;}
. {return yytext[0];}
[\n] {return 0;}
"" {return 0;}
%%

int yywrap(){
    return 1;
}

