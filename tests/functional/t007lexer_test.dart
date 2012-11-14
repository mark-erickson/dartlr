// Copyright (c) 2012, the ANTLR Dart backend project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library t007lexer_test;

import "package:unittest/unittest.dart";
import "package:dartlr/vm_config.dart";
import "package:dartlr/dartlr.dart";
import "../out/t007lexer.dart";

main() {  
  useVmConfiguration();
  
  test('testValid_t007lexer', () {
    ANTLRStringStream stream = new ANTLRStringStream("fofababbooabb");
    Lexer lexer = new t007lexer(stream);
    
    Token token = lexer.nextToken(); 
    expect(token.type, equals(t007lexer.FOO));
    expect(token.startIndex, equals(0));
    expect(token.stopIndex, equals(1));
    expect(token.text, equals("fo"));
    
    token = lexer.nextToken(); 
    expect(token.type, equals(t007lexer.FOO));
    expect(token.startIndex, equals(2));
    expect(token.stopIndex, equals(12));
    expect(token.text, equals("fababbooabb"));
    
    token = lexer.nextToken();
    expect(token.type, equals(t007lexer.EOF));
  });
  
  test('testMalformedInput_t007lexer', () {
    ANTLRStringStream stream = new ANTLRStringStream("foaboao");
    Lexer lexer = new t007lexer(stream);
    Token token = lexer.nextToken();
    String expected = "line 1:6 required(...)+ loop "
               "did not match anything at character 'o'";
    expect(lexer.reportedErrors.last(), equals(expected));
  });
}
