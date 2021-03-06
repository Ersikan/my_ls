/*
** EPITECH PROJECT, 2019
** my_ls
** File description:
** Parse the program arguments into a filename list
*/

#include <stdlib.h>
#include "prototypes.h"

char **parse_arguments(int ac, char **av)
{
    int file_number = 0;
    char **list;

    for (int i = 1; i < ac; i++)
        if (av[i][0] != '-')
            file_number++;
    if ((list = malloc(sizeof(char *) * (file_number + 1))) == NULL)
        return memory_error();
    file_number = 0;
    for (int i = 1; i < ac; i++)
        if (av[i][0] != '-')
            list[file_number++] = av[i];
    list[file_number] = NULL;
    return list;
}
