grammar t052importM2;
options {
    language=Dart;
}

import t052importS2;

@header{part of dartlr_tests;}

s : label=a[3] {this.capture("\${$label.y}");} ;
B : 'b' ; // defines B from inherited token space
WS : (' '|'\n') {this.skip();} ;
