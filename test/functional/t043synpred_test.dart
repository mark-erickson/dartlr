// Copyright (c) 2012, the ANTLR Dart backend project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library dartlr_tests;

import "package:unittest/unittest.dart";
import "package:dartlr/dartlr.dart";

part "../out/t043synpredLexer.dart";
part "../out/t043synpredParser.dart";

main() {
  test('testValid1_t043synpred', () {
    ANTLRStringStream cstream = new ANTLRStringStream('   +foo>');
    t043synpredLexer lexer = new t043synpredLexer(cstream);
    CommonTokenStream tstream = new CommonTokenStream(lexer);
    t043synpredParser parser = new t043synpredParser(tstream); 
    
    int expected = parser.reportedErrors.length;
    parser.a();
    expect(parser.reportedErrors.length, equals(expected));   
  });
  
}
