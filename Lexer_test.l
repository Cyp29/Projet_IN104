# Projet_IN104

%{
#include "Parcer_test.h"
%}

%option noyywrap

blanks    [ \t\n]+
unit      [A-Za-z]+
pv 	      [0-9]+
attaque   \+
atribuer  \=
%%

{blanks}        { /* ignore */ }

{attaque}   { return(ATTAQUE); }
{unit}      { yylval = yytext; return(UNIT); }
{pv}        { yylval = atoi(yytext); return(PV); }
{atribuer}  { return(ATRIBUER); }
%%
