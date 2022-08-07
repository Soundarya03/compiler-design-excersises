%{
    #include<stdio.h>
    int lineCount = 0;
%}


%%

\n {lineCount++;}
["][0-9a-zA-Z_]*["] {ECHO; printf(" Valid string at line %d\n", lineCount);}
["][0-9a-zA-Z_]* {ECHO; printf(" Unterminated string at line %d\n", lineCount);}
. ;

%%

int main(int argc, char* argv[]){
    if(argc<2){
        printf("Too few arguments\n");
        exit(1);
    }

    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
}