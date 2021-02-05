roll: y.tab.c lex.yy.c
	gcc -o parser y.tab.c
	./parser < RollPL.test
y.tab.c: RollPL.yacc lex.yy.c
	yacc RollPL.yacc
lex.yy.c: RollPL.lex
	lex RollPL.lex
clean:
	rm -f lex.yy.c y.tab.c parser
