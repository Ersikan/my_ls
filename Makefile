##
## EPITECH PROJECT, 2019
## my_ls
## File description:
## Main Makefile
##

MAIN = src/main.c
SRC = 	src/options.c \
	src/my_strdup.c \
	src/read_dir.c \
	src/sorting.c \
	src/my_putstr.c \
	src/display.c \
	src/my_strcat.c \
	src/my_strncpy.c \
	src/filepath.c \
	src/parse_arguments.c \
	src/error.c \
	src/my_alphasort.c \
	src/timesort.c \
	src/get_file_info.c \
	src/my_nbr_to_str.c \
	src/get_other_file_infos.c \
	src/destroy.c
OBJ = $(notdir $(MAIN:.c=.o)) $(notdir $(SRC:.c=.o))

TESTS =	tests/test_options.c \
	tests/test_my_strdup.c \
	tests/test_read_dir.c \
	tests/test_sorting.c \
	tests/test_my_putstr.c \
	tests/test_display.c \
	tests/test_my_strcat.c \
	tests/test_my_strncpy.c \
	tests/test_filepath.c \
	tests/test_parse_arguments.c \
	tests/test_error.c \
	tests/test_my_alphasort.c \
	tests/test_timesort.c \
	tests/test_my_nbr_to_str.c \
	tests/test_get_file_info.c \
	tests/test_get_other_file_infos.c
TOBJ = $(notdir $(TESTS:.c=.o)) $(notdir $(SRC:.c=.o))

I_PATH = include/
FLAGS = -Wall -Wextra

NAME = my_ls
BONUS = our_ls

all: $(NAME)

$(NAME) : $(OBJ)
	gcc -o $(NAME) $(OBJ) $(FLAGS)

$(OBJ):
	gcc -c $(MAIN) $(SRC) -I$(I_PATH) $(FLAGS)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

bonus:
	gcc -D BONUS -c $(MAIN) $(SRC) $(FLAGS) -I$(I_PATH)
	gcc -o $(BONUS) $(OBJ) $(FLAGS)

tests_run:
	@gcc -c $(TESTS) $(SRC) -I$(I_PATH) $(FLAGS) --coverage
	@gcc -o unit_test $(TOBJ) $(FLAGS) --coverage -lcriterion
	@./unit_test
	@rm -f unit_test $(TOBJ)

.PHONY: all clean fclean re
