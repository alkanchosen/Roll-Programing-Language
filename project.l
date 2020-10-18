/* project.l */
%option main
alphabetic [A-Za-z_$]
alphanumeric ({alphabetic}|{digit})
digit [0-9]
sign [+-]
%%
if                            printf("IF ");
else                          printf("ELSE ");
while                         printf("WHILE ");
for                           printf("FOR ");
return                        printf("RETURN ");
func                          printf("FUNC_KEY ");
rin                           printf("INPUT_KEY ");
rout                          printf("OUTPUT_KEY ");
true                          printf("TRUE ");
false                         printf("FALSE ");
readInclination               printf("READ_INCLINATION ");
readAltitude                  printf("READ_ALTITUDE ");
readTemperature               printf("READ_TEMPERATURE ");
readAcceleration              printf("READ_ACCELERATION ");
turnOnCamera                  printf("TURN_ON_CAMERA ");
turnOffCamera                 printf("TURN_OFF_CAMERA ");
takePicture                   printf("TAKE_PICTURE ");
readTimestamp                 printf("READ_TIMESTAMP ");
{sign}?{digit}+               printf("INT ");
{sign}?{digit}*(\.){digit}+   printf("FLOAT ");
'{alphanumeric}'              printf("CHAR ");
{alphabetic}{alphanumeric}*   printf("IDENTIFIER ");
(\").+(\")                    printf("STRING ");
(==|!=|>=|>|<=|<)             printf("COMPARISON_OP ");
(&&|\|\||&|\|)                printf("RELATIONAL_OP ");
\/\/.*                        printf("COMMENT ");
\*\*                          printf("FACTOR_OP ");
\+                            printf("ADD_OP ");
-                             printf("SUB_OP ");
\/                            printf("DIV_OP ");
\*                            printf("MULT_OP ");
\%                            printf("MOD_OP ");
\(                            printf("LP ");
\)                            printf("RP ");
;                             printf("SEMI_COLON ");
\{                            printf("L_CB ");
\}                            printf("R_CB ");
\[                            printf("L_SB ");
\]                            printf("R_SB ");
=                             printf("ASSIGN_OP ");
,                             printf("COMMA ");

