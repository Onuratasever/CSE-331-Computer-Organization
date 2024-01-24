#include <stdio.h>

void singleLine()
{
    FILE *dosya;
    char karakter;

    dosya = fopen("input.txt", "r"); 

    if (dosya == NULL) {
        printf("Dosya acilamadi\n");
        return ; 
    }

    while ((karakter = fgetc(dosya)) != EOF) {
        if(karakter != '\n')
        {
            printf("%c", karakter);
        }
    }
    fclose(dosya);
}

int main()
{
    singleLine();
    return 0;
}