# Projet_IN104

CC = gcc
LEXER = flex
PARSER = bison

language : 	language.o language_flex.o
		$(CC) -o -Wall language.o language_flex.o

language.o : language.c
		$(CC) -c -Wall language.c

language.c : parser.y
		$(PARSER) parser.y --defines=tab.h -o language.c

language_flex.o : language_flex.c
		$(CC) -c -Wall language_flex.c

language_flex.c : lexer.l
		$(LEXER) -o language_flex.c lexer.l
