roll: y.tab.c lex.yy.c
	gcc -o parser y.tab.c
	./parser < CS315f20_team22.test
y.tab.c: CS315f20_team22.yacc lex.yy.c
	yacc CS315f20_team22.yacc
lex.yy.c: CS315f20_team22.lex
	lex CS315f20_team22.lex
clean:
	rm -f lex.yy.c y.tab.c parser
