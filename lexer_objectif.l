# Projet_IN104

/*** Definition section ***/
%{
enum yytokentype {ENTIER = 258, REEL,CDC ,VAR ,PLUS, MOINS, FOIX, DIVISE, OUVERT, FERMER, ARRET, IF, ELSE, FOR, EGEG, EG};
int count = 0;
%}

/*** Rules section ***/

blanks      [ \t\n]+
inconue      .+

plus        \+
moins       \-
fois        \*
divise      \/
ouvrir      \(
fermer      \)

if	    "if"
else	    "else"
for	    "for"
egalegal    "=="
egal	    \=
arret	    "end"

reel	    [0-9]+\.[0-9]*
entier      [0-9]+
chainedecar \".*\"

variable [a-zA-Z_][0-9a-zA-Z_]*


%%

{blanks} { /* ignore */ }

{plus}       { printf("PLUS [%s]\n, ", yytext); }
{moins}       { printf("MOINS [%s]\n, ", yytext); }
{fois}       { printf("FOIS [%s]\n, ", yytext); }
{divise}    	 { printf("DIVISE [%s]\n, ", yytext); }
{ouvrir}    	 { printf("OUVERT [%s]\n, ", yytext); }
{fermer}    	 { printf("FERMER [%s]\n, ", yytext); }

{if}       { printf("IF [%s]\n, ", yytext); }
{else}       { printf("ELSE [%s]\n, ", yytext); }
{for}       { printf("FOR [%s]\n, ", yytext); }
{egalegal}    	 { printf("EGEG [%s]\n, ", yytext); }
{egal}    	 { printf("EG [%s]\n, ", yytext); }
{arret}	 {return (ARRET);}

{chainedecar} { /*yylval = yytext;*/ printf("CDC [%s]\n, ", yytext); }
{reel}   { /*yylval = atof(yytext);*/ printf("REEL [%s]\n, ", yytext); }
{entier} { /*yylval = atoi(yytext);*/ printf("ENTIER [%s]\n, ", yytext); }

{variable}  { printf("VAR [%s], ", yytext); }

{inconue}   { printf("INCONUE [%s], ", yytext); }

%%
/*** User Code Section ***/
int yywrap(){}
int main()
{
yylex();

return 0;
}
