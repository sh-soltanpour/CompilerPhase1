grammar Atalk;
 
program : 
    (actordef | NEW_LINE)*
    {System.out.println("program");}
    ;
actordef :
    ACTOR ID '<' CONST_INT '>' NEW_LINE
    (gvardef | receiverdef | NEW_LINE)* END (NEW_LINE)?
    {System.out.println("actordef");}
    ;
receiverdef : 
  RECEIVER ID '(' ((TYPE ('[' expr ']')* ID) (',' TYPE ('[' expr ']')* ID)*)* ')' (NEW_LINE)?
   (statement | NEW_LINE)* END NEW_LINE {System.out.println("receiverdef");}
  ;
gvardef:
    TYPE ('[' expr ']')* ID(','ID)*
    {System.out.println("gvardef");}
    ;
eqvardef:
    TYPE ('[' expr ']')* ID '=' expr
    {System.out.println("eqvardef");}
    ;
arrayinit : 
    '{' arrayinit (','arrayinit)* '}' | CONST_INT | CHARACTER | STRING
    {System.out.println("arrayinit");}
    ;
inrecvardef:
    (eqvardef | gvardef)(','((ID '=' expr)|ID)*)*
    {System.out.println("invarrecdef");}
    ;
ifrule : 
  IF expr (statement | NEW_LINE)* 
  ((ELSEIF) (statement | NEW_LINE)*)*
  (ELSE (statement | NEW_LINE)*)?
  END
  {System.out.println("if rule");}
  ;
foreachrule : 
  FOREACH ID IN ID NEW_LINE (statement| NEW_LINE)* END
  {System.out.println("foreach rule");}
  ;
scoperule :
  'begin' (statement | NEW_LINE)* END
  {System.out.println("scoperule");}
  ;  
statement:
    (inrecvardef | expr | ifrule | foreachrule | scoperule | 'quit' | 'break')NEW_LINE
    {System.out.println("statement");}
    ;
expr:
    (funcall  | termsend   )
    {System.out.println("expr");}
    ;
funcall:
    ID '('( (STRING | expr )(','(STRING |expr ))*)*')'
    {System.out.println("funcall");}
    ;
arraycall: 
    ID ('[' expr ']')+ 
    {System.out.println("arraycall");}
    ;
termsend:
    ((ID | SENDER | SELF) SEND_OPERATOR (funcall)) | termassignment 
    {System.out.println("termsend");}
    ;
termassignment:
    (termor '=' (
    
    termassignment)  | termor)
    {System.out.println("termassignment");}
    ;
termor:
    (termand LOGICAL_OPERATOR_OR termor ) | termand
    {System.out.println("termor");}
    ;
termand:
    (termeq LOGICAL_OPERATOR_AND termand ) | termeq
    {System.out.println("termand");}
    ;
termeq:
    (termrel EQUALITY_OPERATOR termeq ) | termrel
    {System.out.println("termeq");}
    ;
termrel:
    (termpm RELATIONAL_OPERATOR termrel ) | termpm
    {System.out.println("termrel");}
    ;
termpm:
    (termmd ARITHMETIC_PM_OPERATOR termpm ) | termmd
    {System.out.println("termpm");}
    ;
termmd :
    (termunary ARITHMETIC_MD_OPERATOR termmd) | termunary
    {System.out.println("termmd");}
    ;
termunary:
    (LOGICAL_OPERATOR_NOT | '-') termunary | termbracket
    {System.out.println("termunary");}
    ;
termbracket : 
    ('[' termbracket ']') | termpar
    {System.out.println("termbracket");}
    ;
termpar : 
    ( '(' termpar ')') | funcall | arraycall | CHARACTER | STRING | ID | CONST_INT | arrayinit
    {System.out.println("termpar");}
    ;


CHARACTER :
  '\'' [a-zA-Z0-9] '\'' {System.out.println("character");}
  ;

CONST_INT:
  [0-9]+ {System.out.println("const int");}
  ;
COMMENT:
  '#' ~[\n]*  -> skip 
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
TYPE : 
  'int' | 'char' {System.out.println("type");}
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

STRING:
  ["]~["]*["] {System.out.println("string");}
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


SEND_OPERATOR:
  ('<<') {System.out.println("send op");}
  ;

COMMA:
  (',') {System.out.println("comma");} 
  ;

ID:
  [a-zA-Z_][a-zA-Z0-9_]* {System.out.println("id");}
  ;
NEW_LINE:
  [\r\n]+ 
    ;

TAB:
  ('\t'| ' ')+ -> skip 
  ;
