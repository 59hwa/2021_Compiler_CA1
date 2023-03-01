%{
	#include <stdio.h>
	#include <stdlib.h>
	int yylex();
	int yyerror();
	int printErr();
%}

%token UPDATE SET WHERE AND OR IS NOT ID LIKE BETWEEN END 
%token NULL_VAL STR_VAL NUM_VAL DEFAULT_VAL BOOL_VAL UPDATES
%token MAX_FUNC MIN_FUNC AVG_FUNC SUM_FUNC ABS_FUNC CEIL_FUNC FLOOR_FUNC UPPER_FUNC LOWER_FUNC

%%
start: UPDATE ID SET columns clause END {printf("[SUCCESS] Valid Query.\n"); return 0;}
	| UPDATE ID SET columns error {printErr("UPDATE ID SET columns <clause>", "clause");}
	| UPDATE ID SET error {printErr("UPDATE ID SET <columns> clause;", "columns");}
	| UPDATE ID error {printErr("UPDATE ID <SET>", "SET");}
	| UPDATE error {printErr("UPDATE <ID>", "table ID");}
	| UPDATES {printf("[ERROR]Lexical error is occurred in UPDATE");}
	| error {printErr("<UPDATE>", "UPDATE");}
	;
columns: ID '=' col_val ',' columns
	| ID '=' col_val
	| ID '=' error {printErr("ID = <Column value>", "column value");}
	| ID error {printErr("ID <=>", "=");}
	;
col_val: value
	| DEFAULT_VAL
	;
value: NULL_VAL next_val
	| STR_VAL next_val
	| BOOL_VAL next_val
	| pre_num NUM_VAL next_val
	| MAX_FUNC '(' func_value ')' next_val
	| MIN_FUNC '(' func_value ')' next_val
	| AVG_FUNC '(' func_value ')' next_val
	| SUM_FUNC '(' func_value ')' next_val
	| ABS_FUNC '(' func_value ')' next_val
	| CEIL_FUNC '(' func_value ')' next_val
	| FLOOR_FUNC '(' func_value ')' next_val
	| UPPER_FUNC '(' func_value ')' next_val
	| LOWER_FUNC '(' func_value ')' next_val
	;
pre_num: '+' pre_num
	| '-' pre_num
	| '~' pre_num
	|
	;
next_val: arith_op value
	|
	;
func_value: value
	| ID
	;
arith_op: '+'
	| '-'
	| '*'
	| '/'
	| '%'
	| '&'
	| '|'
	| '^'
	;
clause: WHERE where_stmt
	| WHERE error {printErr("WHERE <statement>", "statement");}
	|
	;
where_stmt:
	| condition
	| condition AND condition
	| condition OR condition
	| ID BETWEEN value AND value
	| ID BETWEEN value OR value
	| ID NOT BETWEEN value AND value
	| ID NOT BETWEEN value OR value
	| ID LIKE STR_VAL
	| ID NOT LIKE STR_VAL
	;
condition: '(' where_stmt ')'
	| ID rel_op value
	| ID IS is_val
	| ID IS NOT is_val
	| NOT ID rel_op value
	; 
is_val: BOOL_VAL
	| NULL_VAL
	;
rel_op: '='
	| '!''='
	| '<''>'
	| '<'
	| '>'
	| '>''='
	| '<''='
	| '<''=''>'
	;
%%

int yyerror(char* const msg) {
	fprintf(stderr, "[ERROR] Error type: %s\n", msg);
	return 2;
}

int printErr(char* errPos, char* errType) {
	printf("[ERROR] A syntatic error occurred in [%s]\n\t<%s> is missing or not correct.\n", errPos, errType);
	exit(0);
	return 2;
}

int main(void) {
	printf("Input Query: ");
	yyparse();
	return 0;
}
