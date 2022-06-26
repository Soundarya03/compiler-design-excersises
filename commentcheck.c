#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
    char line[100];
    FILE *fp;
    int isOpen = 0;
    int lineCount = 0;
    int openLineCount = 0;

    if (argc < 2)
    {
        printf("Too few arguments. Specify file to be read\n");
    }

    fp = fopen(argv[1], "r");
    if (fp == NULL)
    {
        printf("Couldn't open file\n");
        exit(1);
    }

    while (fgets(line, sizeof(line), fp) != NULL)
    {
        lineCount++;
        for (int i = 0; i < strlen(line); i++)
        {
            if (isOpen == 0)
            {
                if (line[i] == '/' && line[i + 1] == '*')
                {
                    isOpen = 1;
                    openLineCount = lineCount;
                }
            }
            else
            {
                if (line[i] == '*' && line[i + 1] == '/')
                {
                    isOpen = 0;
                }
            }
        }
    }

    fclose(fp);

    if (isOpen == 1)
    {
        printf("Unterminated multiline comment starting at line %d\n", openLineCount);
        exit(1);
    }
    else
    {
        printf("all good!\n");
    }

    exit(0);
}