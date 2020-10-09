/* project.l */
%%
[0-9] return (INTEGER);
\n    return (NEWLINE);
.     return (yytext[0]);
%%
int yywrap() {return 1;}