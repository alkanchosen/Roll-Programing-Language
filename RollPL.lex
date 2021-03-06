alphabetic [A-Za-z_$]
alphanumeric ({alphabetic}|{digit})
digit [0-9]
sign [+-]
newline \n
%option yylineno
%%
start                         return(START);
end                           return(END);
if                            return(IF);
else                          return(ELSE);
while                         return(WHILE);
for                           return(FOR);
return                        return(RETURN);
func                          return(FUNC_KEY);
rin                           return(INPUT_KEY);
rout                          return(OUTPUT_KEY);
true                          return(TRUE);
false                         return(FALSE);
connectToBase                 return(CONNECT_TO_BASE);
readInclination               return(READ_INCLINATION);
readAltitude                  return(READ_ALTITUDE);
readTemperature               return(READ_TEMPERATURE);
readAcceleration              return(READ_ACCELERATION);
turnOnCamera                  return(TURN_ON_CAMERA);
turnOffCamera                 return(TURN_OFF_CAMERA);
takePicture                   return(TAKE_PICTURE);
readTimestamp                 return(READ_TIMESTAMP);
{sign}?{digit}+               return(INT);
{sign}?{digit}*(\.){digit}+   return(FLOAT);
'{alphanumeric}'              return(CHAR);
{alphabetic}{alphanumeric}*   return(IDENTIFIER);
(\").+(\")                    return(STRING);
(==|!=|>=|>|<=|<)             return(COMPARISON_OP);
!                             return(NOT_OP);
&&                            return(AND_OP);
\|\|                          return(OR_OP);
\/\/.*                        return(COMMENT);
\*\*                          return(FACTOR_OP);
\+                            return(ADD_OP);
-                             return(SUB_OP);
\/                            return(DIV_OP);
\*                            return(MULT_OP);
\%                            return(MOD_OP);
\(                            return(LP);
\)                            return(RP);
;                             return(SEMI_COLON);
\{                            return(L_CB);
\}                            return(R_CB);
\[                            return(L_SB);
\]                            return(R_SB);
=                             return(ASSIGN_OP);
,                             return(COMMA);
[ |\t|\n]+                    ;
%%
int yywrap() { return 1; }
