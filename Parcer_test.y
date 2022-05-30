# Projet_IN104

%{
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#include "tree.c"
#define YYSTYPE int
int yyparse();
int yylex();
int yyerror(char *s);
%}

//Symboles terminaux qui seront fournis par yylex()
%token UNIT
%token PV
%token ATRIBUER
%left ATTAQUE
%type<node_unit> id
%%

Artibution:

UNIT ATRIBUER PV {
				struct node_unit* unite = cree_nood_unit($1, $3)
				$$ = unite;}
;

Combat:

id ATTAQUE id {
				struct node_atta* attaque = cree_nood_atta($1, $3, "ATTAQUE"); 
				$$ = attaque;
				$1->PV = $1->PV - $2->PV ;
				$3->PV = $2->PV - $1->PV;}



%%

int yyerror(char *s) {
    printf("yyerror : %s\n",s);
    return 0;
}

int main(void) {
    yyparse();
    return 0;
}
