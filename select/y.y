%{ 
	#include <stdio.h> 
	#include <stdlib.h> 
	int yylex(); 
	int yyerror(); 
	int printErr(); 
%} 
  
%token SELECT FROM DISTINCT 
%token GROUP HAVING ORDER DESC ASC 
%token WHERE AND OR IS NOT ID LIKE BETWEEN END  
%token NULL_VAL STR_VAL NUM_VAL DEFAULT_VAL BOOL_VAL SELECTS
%token MAX_FUNC MIN_FUNC AVG_FUNC SUM_FUNC ABS_FUNC CEIL_FUNC FLOOR_FUNC UPPER_FUNC LOWER_FUNC 

%% 
start	: SELECT dist attributList FROM tableList clause group order END {printf("[SUCCESS] Valid Query.\n"); return 0;}
	| SELECT dist attributList FROM tableList error {printf("missing semicolon");}
	| SELECT dist attributList FROM error {printErr("SELECT attributList FROM <tableList>","tableList");}
	| SELECT dist attributList error {printErr("SELECT attributList <FROM>","FROM");}
	| SELECT dist error {printErr("SELECT <attributList>","attributList");}
	| error {printErr("<SELECT>", "SELECT");}
	| SELECTS {printf("[ERROR]Lexical error occurred in SELECT\n");}
	;
dist : DISTINCT 
	| 
	; 
attributList : ID',' attributList 
	| ID
	| '*'
	; 
tableList	: ID',' tableList 
	| ID 
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
rel_op: '=' 
    	| '!''=' 
    	| '<''>' 
    	| '<' 
    	| '>' 
    	| '>''=' 
    	| '<''=' 
    	| '<''=''>' 
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
next_val: arith_op value 
    	| 
    	; 
is_val: BOOL_VAL 
    	| NULL_VAL 
    	; 
func_value: value 
    	| ID 
    	; 
pre_num: '+' pre_num 
    	| '-' pre_num 
    	| '~' pre_num 
    	|
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
group: GROUP attributList having 
	| GROUP attributList error {printErr("GROUP attributList <HAVING>", "HAVING");} 
	| GROUP error {printErr("GROUP <attributList>", "attributList");} 
	| 
	; 
order: ORDER attributList da 
	| ORDER attributList error {printErr("ORDER attributList <DESC/ASC>", "DESC/ASC");} 
	| ORDER error {printErr("ORDER <attributList>", "attributList");} 
	| 
	; 
da:	DESC 
	| ASC 
	| 
	;
having: HAVING condition 
	| HAVING error {printErr("HAVING <condition>","condition");} 
	| 
	; 
%% 
  
int yyerror(char* const msg) { 
	fprintf(stderr, "[ERROR] Error type: %s\n", msg);
	return 2; 
} 
  
int printErr(char* errPos, char* errType) { 
	printf("[ERROR] A syntax error occurred in [%s]\n\t<%s> is missing or not correct.\n", errPos, errType); 
	exit(0); 
	return 2;
} 
  
int main(void) { 
	printf("Input Query: "); 
	yyparse(); 
	return 0; 
} 