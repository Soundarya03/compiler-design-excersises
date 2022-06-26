#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    FILE *fp;
    char line[100];
    int isOpen = 0;
    int lineCount = 0;

    if (argc < 2)
    {
        printf("Too few arguments. Specify file to be read\n");
        exit(1);
    }

    fp = fopen(argv[1], "r");

    if (fp == NULL)
    {
        printf("Couldn't open file\n");
        exit(1);
    }
    while (fgets(line, sizeof(line), fp) != NULL)
    {
        isOpen = 0;
        lineCount++;
        for (int i = 0; i < strlen(line); i++)
        {
            if (line[i] == '"')
            {
                isOpen = (isOpen == 0) ? 1 : 0;
            }
        }

        if (isOpen == 1)
        {
            printf("Unterminated string constant at line number %d\n", lineCount);
        }
    }

    fclose(fp);

    printf("all good\n");
    exit(0);
}