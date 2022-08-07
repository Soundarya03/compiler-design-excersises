%{
    #include<stdio.h> 
    #include "y.tab.h" 
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {return id;}
("int"|"register int"|"long int"|"double"|"static int"|"float") {printf("type detected"); return type;}
[\t] {;}
[\n] {return 0;}
. {return yytext[0];}
%%
