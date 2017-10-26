lexer grammar Atalk;

program : 
    [actordef]*
    {System.out.println("program");}
    ;
actordef :
    ACTOR '<' CONST_INT '>' NEWLINE
    [vardef | receiverdef]* END
    {System.out.println("actordef");}
    ;
gvardef:
    TYPE ID[','ID]*
    {System.out.println("gvardef");}
    ;
eqvardef:
    TYPE ID '=' expr
    {System.out.println("eqvardef");}
    ;
inrecvardef:
    (eqvardef | gvardef)(','((ID '=' expr)|ID)*)*
    {System.out.println("invarrecdef");}
    ;
statement:
    ((inrecvardef | expr)'\n')*
    {System.out.println("satetment");}
    ;
expr:
    (funcall | arithexp | ID)
    {System.out.println("expr");}
    ;
funcall:
    ID '('(expr(','expr)*)*')'
    {System.out.println("funcall");}
    ;
arithexp:
    (((ID|SENDER)SEND_OPERATOR arithexp) |
      arithexp LOGICAL_OPERATOR_OR arithexp |
      arithexp LOGICAL_OPERATOR_AND arithexp |
      arithexp EQUALITY_OPERATOR arithexp |
      arithexp RELATIONAL_OPERATOR arithexp |
      arithexp ARITHMETIC_PM_OPERATOR arithexp |
      arithexp ARITHMETIC_MD_OPERATOR arithexp |
      (LOGICAL_OPERATOR_NOT | '-')arithexp |
      '[' expr ']' |
      '(' expr ')' 
      {System.out.println("arithexp");}
    ; 

CONST_INT:
        [0-9]+ {System.out.println("const int");}
    ;
COMMENT:
    '#'()*'\n' {System.out.println("comment");}
  ;
SENDER :
    'sender' {System.out.println("Sender Token");}
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
ARITHMETIC_PM_OPERATOR :
  ('+' | '-' ) {System.out.println("arithmetic pm op");}
  ;
ARITHMETIC_MD_OPERATOR :
  ('*' | '/' ) {System.out.println("arithmetic md op");}
  ;
RELATIONAL_OPERATOR :
  ('<' | '>') {System.out.println("relational");}
  ;
EQUALITY_OPERATOR:
  ('<>' | '==') {System.out.println("equalty op");}
  ;

LOGICAL_OPERATOR_AND :
  ('and' ) {System.out.println("logical and op");}
  ;

LOGICAL_OPERATOR_OR :
  ('or' ) {System.out.println("logical or op");}
  ;

LOGICAL_OPERATOR_NOT:
  ('not') {System.out.println("logical not op");}
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

ID:
  [a-zA-Z_][a-zA-Z0-9_]* {System.out.println("id");}
  ;
NEW_LINE:
  [ \r\n]+ -> skip 
    ;

TAB:
  [\t]+ -> skip 
  ;
