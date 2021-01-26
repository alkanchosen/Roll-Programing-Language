# Roll Programming Language

### Project: A Programming Language for Drones, its Lexical Analyzer and parser

  This project involves designing a programming language for drones, writing its lexical analyzer and building a parser for our design using the `yacc` tool.
  
  This repository contains these files:

  1. **RollPL.lex:** This file contains the lexical analyzer for our programming language.
  
  2. **RollPL.yacc:** This yacc file is the parser of our programming language. If the input file has valid syntax, it prints a success message. Otherwise, it prints an error message indicating the line number of erroneous line.
  
  3. **RollPL.test:** This is an example program which is written in Roll programming language.
  
  4. **Makefile:** This Makefile produces a complete parser as an executable file and sends the test program to this executable.
  
  BNF description of the language:

    •	variable identifiers

    •	assignment operator

    •	precedence, associativity of the operators

    •	expressions (arithmetic, relational, boolean, their combination)

    •	loops

    •	conditional statements

    •	statements for input / output

    •	function definitions and function calls.

    •	comments

    •	primitive functions for:

      o	reading the inclination of the drone 

      o	reading the altitude 

      o	reading the temperature

      o	reading the acceleration

      o	turning on/off video camera

      o	taking pictures with video camera

      o	reading current timestamp from timer
     
      o connecting to the base computer through wi-fi
