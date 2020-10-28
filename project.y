%token START END IF ELSE WHILE FOR RETURN FUNC_KEY INPUT_KEY OUTPUT_KEY TRUE FALSE 
%token READ_INCLINATION READ_ALTITUDE READ_TEMPERATURE READ_ACCELERATION TURN_ON_CAMERA
%token TURN_OFF_CAMERA TAKE_PICTURE READ_TIMESTAMP INT FLOAT CHAR IDENTIFIER STRING
%token COMPARISON_OP NOT_OP AND_OP OR_OP COMMENT FACTOR_OP ADD_OP SUB_OP DIV_OP MULT_OP 
%token MOD_OP LP RP SEMI_COLON L_CB R_CB L_SB R_SB ASSIGN_OP COMMA NOT_OP CHARACTER
%%
program: START stmt_list END
line: COMMENT | stmt SEMI_COLON COMMENT
stmt_list: line | stmt_list line
stmt_block: L_CB stmt_list R_CB 
stmt: matched | unmatched
matched: IF LP conditional_expr RP L_CB matched R_CB ELSE L_CB matched R_CB
         | for_loop | while_loop | function_declaration | function_call | assignment_stmt | return_stmt | input_stmt | output_stmt
unmatched: IF LP conditional_expr RP stmt_block
         | IF LP conditional_expr RP matched ELSE unmatched

assignment_stmt: IDENTIFIER ASSIGN_OP conditional_expr

conditional_expr: conditional_expr OR_OP conditional_term | conditional_term
conditional_term: conditional_term AND_OP conditional_factor | conditional_factor
conditional_factor: conditional_factor NOT_OP conditional_result | conditional_result
conditional_result: LP conditional_expr RP | comp_expr

comp_expr: comp_expr COMPARISON_OP arithmetic_expr | arithmetic_expr

arithmetic_expr: arithmetic_expr ADD_OP arithmetic_term | arithmetic_expr SUB_OP arithmetic_term | arithmetic_term
arithmetic_term: arithmetic_term MULT_OP arithmetic_factor | arithmetic_term DIV_OP arithmetic_factor
               | arithmetic_term MOD_OP arithmetic_factor | arithmetic_factor
arithmetic_factor: arithmetic_factor FACTOR_OP arithmetic_result | arithmetic_result
arithmetic_result: LP arithmetic_expr RP | constant | IDENTIFIER | function_call

for_loop: FOR LP assignment_stmt SEMI_COLON conditional_expr SEMI_COLON assignment_stmt RP stmt_block
while_loop: WHILE LP conditional_expr RP stmt_block

constant: INT | CHAR | STRING | boolean | FLOAT
boolean: TRUE | FALSE

input_stmt: INPUT_KEY LP RP
output_stmt: OUTPUT_KEY LP conditional_expr RP

function_declaration: FUNC_KEY function_name LP function_params RP stmt_block | FUNC_KEY function_name LP RP stmt_block
function_call: function_name LP expr_list RP | function_name LP  RP | primitive_function_key LP RP
expr_list: expr_list COMMA conditional_expr | conditional_expr

return_stmt: RETURN conditional_expr

function_name: IDENTIFIER
function_params: function_param | function_params COMMA function_param
function_param: IDENTIFIER

primitive_function_key: READ_INCLINATION | READ_ALTITUDE | READ_TEMPERATURE | READ_ACCELERATION | TURN_ON_CAMERA
                        | TURN_OFF_CAMERA | TAKE_PICTURE | READ_TIMESTAMP

%%
#include "lex.yy.c"
yyerror(char *s) { printf("%s\n", s); }
main() { return yyparse(); }

