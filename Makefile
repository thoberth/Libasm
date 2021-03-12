# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: thoberth <thoberth@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/09 12:38:38 by thoberth          #+#    #+#              #
#    Updated: 2021/03/09 15:06:04 by thoberth         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


SRCSASM = $(wildcard *.s)

MAIN = main.c

HDR = libasm.h

OBJS = $(SRCSASM:.s=.o)

NASM = nasm -I ${HDR}

EXEC = tester

CC = gcc

OS = $(shell uname)
ifeq ($(OS), Darwin)
	NASMFLG = -f macho64
else
	NASMFLG = -f elf64
endif

RM = rm -f

ARRC = ar rcs ${NAME}

NAME = libasm.a

all: ${EXEC}

${EXEC} : ${NAME}
	${CC} ${MAIN} $< -o $@

${NAME} : ${OBJS}
	${ARRC} ${OBJS}

%.o : %.s
	${NASM} ${NASMFLG} -o $@ $^

clean :
	${RM} ${OBJS}; ${RM} ${NAME}

fclean : clean
	${RM} ${EXEC}

re : fclean all

.PHONY : all clean fclean re