%{
	#include <stdio.h>
	#include "y.tab.h"
%}

id [A-Za-z_]+[A-Za-z0-9_]*
backticks_id [`][A-Za-z_]+[A-Za-z0-9_ ]*[`]
digit [0-9]
number {digit}+(\.{digit}+)?
string_literal (['](\\\'|[^'])*['])|(["](\\\"|[^"])*["])

%%
[sS][eE][lL][eE][cC][tT]						return SELECT;
[sS][eE][lL][eE][cC][tT][sS]					return SELECTS;
[fF][rR][oO][mM]							return FROM;
[gG][rR][oO][uU][pP][ ][bB][yY]				return GROUP;
[hH][aA][vV][iI][nN][gG]					return HAVING;
[oO][rR][dD][eE][rR][ ][bB][yY]				return ORDER;
[dD][eE][sS][cC]							return DESC;
[aA][sS][cC]								return ASC;
[wW][hH][eE][rR][eE]						return WHERE;
[aA][nN][dD]								return AND;
[oO][rR]									return OR;
[iI][sS]									return IS;
[nN][oO][tT]								return NOT;
[lL][iI][kK][eE]								return LIKE;
[bB][eE][tT][wW][eE][eE][nN]				return BETWEEN;
[nN][uU][lL][lL]							return NULL_VAL;
[dD][eE][fF][aA][uU][lL][tT]					return DEFAULT_VAL;
[tT][rR][uU][eE]							return BOOL_VAL;
[fF][aA][lL][sS][eE]							return BOOL_VAL;
[mM][aA][xX]							return MAX_FUNC;
[mM][iI][nN]								return MIN_FUNC;
[aA][vV][gG]								return AVG_FUNC;
[sS][uU][mM]								return SUM_FUNC;
[aA][bB][sS]								return ABS_FUNC;
[cC][eE][iI][lL]								return CEIL_FUNC;
[fF][lL][oO][oO][rR]						return FLOOR_FUNC;
[uU][pP][pP][eE][rR]						return UPPER_FUNC;
[lL][oO][wW][eE][rR]						return LOWER_FUNC;
{string_literal}								return STR_VAL;
{number}   								return NUM_VAL;
{backticks_id}								return ID;
{id}										return ID;
[+]										return yytext[0];
[-]										return yytext[0];
[*]										return yytext[0];
[/]										return yytext[0];
[%]										return yytext[0];
[&]										return yytext[0];
[~]										return yytext[0];
[|]										return yytext[0];
[\^]									return yytext[0];
[(]										return yytext[0];
[)]										return yytext[0];
[,]										return yytext[0];
(!)?[=]									return yytext[0];
[<>](=)?									return yytext[0];
"<>"										return yytext[0];
"<=>"									return yytext[0];
;										return END;
[ \t\n]+								;
.										{printf("[ERROR] A lexical error occurred\n\tUnknown token type <%c>\n", yytext[0]); exit(0);}
%%

int yywrap(){
	return 1;
}
