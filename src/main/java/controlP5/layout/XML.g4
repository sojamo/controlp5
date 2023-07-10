grammar XML;

document  : '<Window>' element* '</Window>' ;

element   : startTag (content )? endTag
          | SELF_CLOSING
          ;

startTag  : OPEN Name  attribute* CLOSE ;

endTag    : OPEN_SLASH Name CLOSE ;

content   : element | STRING ;

SELF_CLOSING : OPEN Name SLASH_CLOSE ;

attribute : Name EQUALS value ;



value: STRING
     | NUMBER UNIT
     | rgb;

rgb: 'rgb' '(' NUMBER ',' NUMBER ',' NUMBER ')';

UNIT: 'px' | '%';
WS : [ \t\r\n]+ -> skip;
OPEN      : '<' ;
OPEN_SLASH: '</' ;
CLOSE     : '>' ;
SLASH_CLOSE: '/>' ;
EQUALS    : '=' ;

Name      : ALPHA (ALPHA | DIGIT | '.' | '-' | '_')* ;
STRING    : '"' ( ~'"' )* '"' | '\'' ( ~'\'' )* '\'' ;
NUMBER : DIGIT+ ;

fragment DIGIT : [0-9] ;
fragment ALPHA : [a-zA-Z] ;
