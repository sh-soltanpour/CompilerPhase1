grammar Atalk;
 
program : 
    {System.out.println("program");}
    (actordef | NEW_LINE)*
    
    ;
actordef :
    ACTOR (id=ID) '<' CONST_INT '>' NEW_LINE
    (gvardef | receiverdef | NEW_LINE)* END (NEW_LINE)?
    {System.out.println("actordef: " + $id.getText());}
    ;
receiverdef : 
  RECEIVER (id=ID) '(' ((TYPE ('[' expr ']')* ID) (',' TYPE ('[' expr ']')* ID)*)* ')' (NEW_LINE)?
   (statement | NEW_LINE)* END NEW_LINE {System.out.println("receiverdef: " + $id.getText());}
  ;
gvardef:
    TYPE ('[' expr ']')* (ID)(','ID)*
    {System.out.println("gvardef");}
    ;
eqvardef:
    TYPE ('[' expr ']')* ID '=' expr
    {System.out.println("eqvardef");}
    ;
arrayinit : 
    {System.out.println("arrayinit");}
    '{' arrayinit (','arrayinit)* '}' | CONST_INT | CHARACTER | STRING
    
    ;
inrecvardef:
    {System.out.println("invarrecdef");}
    (eqvardef | gvardef)(','((ID '=' expr)|ID)*)*
    ;
ifrule : 
  {System.out.println("if rule");}
  IF expr (statement | NEW_LINE)* 
  ((ELSEIF) (statement | NEW_LINE)*)*
  (ELSE (statement | NEW_LINE)*)?
  END
  
  ;
foreachrule : 
{System.out.println("foreach rule");}
  FOREACH ID IN ( (ID('['CONST_INT']')*) | arrayinit | STRING) NEW_LINE (statement| NEW_LINE)* END
  
  ;
scoperule :
{System.out.println("scoperule");}
  'begin' (statement | NEW_LINE)* END
  ;  
statement:
    {System.out.println("statement");}
    (inrecvardef | expr | ifrule | foreachrule | scoperule | 'quit' | 'break')NEW_LINE
    ;
expr:
    {System.out.println("expr");}
    (funcall  | termsend   )
    ;
funcall:
     {System.out.println("funcall");}
    ID '('( (STRING | expr )(','(STRING |expr ))*)*')'
    ;
arraycall: 
    {System.out.println("arraycall");}
    ID ('[' expr ']')+ 
    ;
termsend:
    ((ID | SENDER | SELF) (op='<<') (funcall)) {System.out.println("termsend: " + $op.getText());}| termassignment 
    
    ;
termassignment:
    (termor (op='=') (
    termassignment) {System.out.println("termassignment: " + $op.getText());} | termor)
    ;
termor:
    (termand (op='or') termor ){System.out.println("termor: " + $op.getText());} | termand 
    
    ;
termand:
    (termeq (op='and') termand ) {System.out.println("termand: " + $op.getText());} | termeq
    
    ;
termeq:
    (termrel (op=('<>' | '==')) termeq ) {System.out.println("termeq: " + $op.getText());}| termrel
    
    ;
termrel:
    (termpm (op=('<' | '>')) termrel ) {System.out.println("termrel: " + $op.getText());}| termpm
    
    ;
termpm:
    (termmd (op=('-' | '+')) termpm ) {System.out.println("termpm: " + $op.getText());}| termmd
    
    ;
termmd :
    (termunary (op=('*' | '/')) termmd) {System.out.println("termmd" + $op.getText());} | termunary
    
    ;
termunary:
    (op=('not' | '-')) termunary   {System.out.println("termunary" + $op.getText());}| termbracket
   
    ;
termbracket : 
    {System.out.println("termbracket");}
    ('[' termbracket ']') | termpar
    
    ;
termpar : 
    {System.out.println("termpar");}
    ( '(' expr ')') | funcall | arraycall | CHARACTER | STRING | ID | CONST_INT | arrayinit
    ;


CHARACTER :
  {System.out.println("character");} '\'' [a-zA-Z0-9] '\'' 
  ;

CONST_INT:
  {System.out.println("const int");} [0-9]+ 
  ;
COMMENT:
  '#' ~[\n]*  -> skip 
  ;
SENDER :
  {System.out.println("Sender Token");} 'sender' 
  ;
ACTOR: 
  {System.out.println("actor");} 'actor' 
  ;
RECEIVER:
  {System.out.println("receiver");} 'receiver' 
  ;
TYPE : 
  {System.out.println("type");} 'int' | 'char' 
  ;

FOREACH:
  {System.out.println("foreach");} 'foreach' 
  ;
BREAK:
 {System.out.println("break");}  'break' 
  ;
IF:
  {System.out.println("if");}  'if'  
  ;
ELSEIF:
  {System.out.println("elseif");}  'elseif' 
  ;
ELSE:
  {System.out.println("else");} 'else'   
  ;
SELF:
  {System.out.println("self");}  'self' 
  ;
END :
  {System.out.println("end");} 'end'  
  ;
BEGIN :
  {System.out.println("begin");}  'begin' 
  ;
IN :
  {System.out.println("in");} 'in'   
  ;

STRING:
  {System.out.println("string");} ["]~["]*["] 
  ;

COMMA:
  {System.out.println("comma");} (',') 
  ;

ID:
  {System.out.println("id");} [a-zA-Z_][a-zA-Z0-9_]* 
  ;
NEW_LINE:
  {System.out.println("new line");}[\r\n]+ 
    ;

TAB:
  ('\t'| ' ')+ -> skip 
  ;
