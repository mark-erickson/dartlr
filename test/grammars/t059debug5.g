grammar t059debug5;
options {
  language=Dart;
}

@header{part of dartlr_tests;}

a : ID ( ID | INT ) EOF;
ID : 'a'..'z'+ ;
INT : '0'..'9'+ ;
WS : (' '|'\n') {$channel = HIDDEN;} ;