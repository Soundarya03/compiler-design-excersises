%{
    #include<stdio.h>
    #include<stdlib.h>
    #include "y.tab.h"
    extern int yylval;
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {return id;}
[0-9]+('.'[0-9]+)? {yylval=atoi(yytext); return num;}
[\t] {;}
[\n] {return 0;}
. {return yytext[0];}
%%