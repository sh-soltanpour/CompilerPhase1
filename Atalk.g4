lexer grammar Atalk;

CONST_INT:
        [0-9]+ {System.out.println("const int");}
    ;
COMMENT:
    '#'()*'\n' {System.out.println("comment");}
  ;
SENDER :
    'sender' {System.out.println("Sender Token");}
  ;
OPEN_PAR:
    '(' {System.out.println("(");}
  ;

CLOSE_PAR:
    ')' {System.out.println(")");}
  ;
ACTOR: 
  'actor' {System.out.println("actor");}
  ;
RECEIVER:
  'receiver' {System.out.println("receiver");}
  ;
INT:
  'int' {System.out.println("int");}
  ;
CHAR:
  'char' {System.out.println("char");}
  ;
QUIT:
  'quit' {System.out.println("quit");}  
  ;
FOREACH:
  'foreach' {System.out.println("foreach");}  
  ;
BREAK:
  'break' {System.out.println("break");}  
  ;
IF:
  'if'  {System.out.println("if");}  
  ;
ELSEIF:
  'elseif' {System.out.println("elseif");}  
  ;
ELSE:
  'else' {System.out.println("else");}  
  ;
SELF:
  'self' {System.out.println("self");}  
  ;
END :
  'end' {System.out.println("end");}  
  ;
BEGIN :
  'begin' {System.out.println("begin");}  
  ;
IN :
  'in' {System.out.println("in");}  
  ;
READ : 
  'read' {System.out.println("read");}
  ;
WRITE:
  'write' {System.out.println("write");}
  ;
SINGLE_QUOTE:
  '\'' {System.out.println("Single quote");}
  ;
DOUBLE_QUOTE : 
  '\"\"' {System.out.println("Double quote");}
  ;
CHARACTER :
	['][a-zA-Z0-9]['] {System.out.println("character");}
	;
STRING:
  ["][a-zA-Z-_0-9]*["] {System.out.println("string");}
  ;
ARITHMETIC_OPERATOR :
  ('+' | '-' | '*' | '/') {System.out.println("arithmetic op");}
  ;
RELATIONAL_OPERATOR :
  ('==' | '<>' | '<' | '>') {System.out.println("relational");}
  ;
LOGICAL_OPERATOR :
  ('and' | 'or' | 'not') {System.out.println("logical op");}
  ;
ASSIGNMENT_OPERATOR:
  ('=') {System.out.println("assigment op");}
  ;
SEND_OPERATOR:
  ('«') {System.out.println("send op");}
  ;
COMMA:
  (',') {System.out.println("comma");} 
  ;
BRACKET_OPEN :
  ('[') {System.out.println("bracket open");} 
  ;
BRACKET_CLOSE : 
  (']') {System.out.println("bracket close");}
  ;
ID:
        [a-zA-Z_][a-zA-Z0-9_]* {System.out.println("id");}
 	;
NEW_LINE:
        [ \r\n]+ -> skip 
    ;
TAB:
    [\t]+ -> skip 
  ;
