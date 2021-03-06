// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
@initializeTracker
library initialize.initializer_parts_test;

import 'package:initialize/src/initialize_tracker.dart';
import 'package:initialize/initialize.dart';
import 'package:unittest/unittest.dart';
import 'package:unittest/compact_vm_config.dart';

part 'parts/foo.dart';
part 'parts/bar.dart';

main() {
  useCompactVMConfiguration();

  // Run all initializers.
  run().then((_) {
    test('parts', () {
      var expectedNames = [
        const LibraryIdentifier(#initialize.initializer_parts_test, null,
            'initializer_parts_test.dart'),
        bar2,
        bar,
        foo,
        baz,
        Bar2,
        Bar,
        Foo,
        Baz,
      ];
      expect(InitializeTracker.seen, expectedNames);
    });
  });
}

@initializeTracker
class Baz {}

@initializeTracker
baz() {}
