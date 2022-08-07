%{
    #include<stdio.h> 
    #include "y.tab.h"  
    extern int yylval; 
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {return id;}
[0-9]+([.][0-9]+)? {return num;}
'=' {return equal;}
[\t] {;}
[\n] {return 0;}
'' {return 0;}
. {return yytext[0];}
%%

int yywrap(){
    return 1;
}