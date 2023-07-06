grammar XML;

document  : element EOF ;

element   : startTag (content | SPACE)* endTag
          | SELF_CLOSING
          ;

startTag  : OPEN Name attribute* CLOSE ;

endTag    : OPEN_SLASH Name CLOSE ;

SELF_CLOSING : OPEN Name SLASH_CLOSE ;

attribute : Name EQUALS STRING ;

content   : element | STRING ;


SPACE     : [ \t\r\n] ;
OPEN      : '<' ;
OPEN_SLASH: '</' ;
CLOSE     : '>' ;
SLASH_CLOSE: '/>' ;
EQUALS    : '=' ;

Name      : ALPHA (ALPHA | DIGIT | '.' | '-' | '_')* ;
STRING    : '"' ( ~'"' )* '"' | '\'' ( ~'\'' )* '\'' ;

fragment DIGIT : [0-9] ;
fragment ALPHA : [a-zA-Z] ;
