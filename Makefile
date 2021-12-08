# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hugsbord <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/24 18:42:27 by hugsbord          #+#    #+#              #
#    Updated: 2021/12/08 12:14:09 by hugsbord         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME = fractol

SRCS =	./srcs/main.c \
		./srcs/init.c \
		./srcs/fractol.c \
		./srcs/iteration.c \
		./srcs/key_event.c \
		./srcs/julia_key_event.c \
		./srcs/exit.c

INC = -I./inc

FLAGS = -Wall -Wextra -Werror

OS = $(shell uname)

LIBS = $(LIBS_MAC)
MLX_D = ./minilibx_opengl_macOS

LIBS_MAC =-L ./libft -lft -L  $(MLX_D) -lmlx -framework OpenGL -framework AppKit

LIBS_LINUX =-L ./libft -L $(MLX_D) -lft -lmlx -lm -lbsd -lX11 -lXext

ifeq ($(OS), Linux)
	LIBS = $(LIBS_LINUX)
else
	LIBS = $(LIBS_MAC)
endif

OBJ=$(SRCS:.c=.o)

%.o: %.c
	@clang $(INC) -o $@ -c $<

all: $(NAME)

$(NAME): $(OBJ)
	@echo "\033[96m"
	@echo "                            :::      ::::::::"
	@echo "                          :+:      :+:    :+:"
	@echo "    42_cursus:          +:+ +:+         +:+"
	@echo "    FRACT-OL          +#+  +:+       +#+"
	@echo "                    +#+#+#+#+#+   +#+"
	@echo "                          #+#    #+#"
	@echo "                         ###   ########.fr\033[0m"
	@echo "\033[0m"
	@echo "\033[93m>> Libft compilation\033[0m"
	@make -C libft
	@echo "\033[93m>> Fract-ol compilation\033[0m"
	@clang $(FLAGS) $(INC) -o $(NAME) $(OBJ) $(LIBS)
	@echo "\033[92mFract-ol correctly compilated\033[0m"

clean: $(OBJ)
	@echo "\033[93m>> Cleaning objects (.obj)\033[0m"
	@make $@ -C libft
	@rm -f $(OBJ)

fclean: clean
	@make $@ -C libft
	@rm -f $(NAME)

re:
	@make fclean
	@make all

bonus: $(NAME)

.PHONY: all, clean, fclean, re, bonus
