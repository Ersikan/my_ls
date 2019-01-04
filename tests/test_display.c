/*
** EPITECH PROJECT, 2019
** my_ls
** File description:
** Unit tests for display.c
*/


#include <criterion/criterion.h>
#include <criterion/redirect.h>
#include "prototypes.h"

void redirect(void);

Test(display_list, normal, .init = redirect)
{
    char *list[5] = {"abc", "lol", "x", "", NULL};

    display_list(list);
    cr_assert_stdout_eq_str("abc\nlol\nx\n\n");
}

Test(display_directory, no_header, .init = redirect)
{
    display_directory("tests/test_dir", 0);
    cr_assert_stdout_eq_str("directory\nfile\nlink\n");
}

Test(display_directory, header, .init = redirect)
{
    display_directory("tests/test_dir", 1);
    cr_assert_stdout_eq_str("tests/test_dir:\ndirectory\nfile\nlink\n");
}
