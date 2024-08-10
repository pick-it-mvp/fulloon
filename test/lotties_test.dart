import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:juction/resources/resources.dart';

void main() {
  test('lotties assets test', () {
    expect(File(Lotties.bell).existsSync(), isTrue);
  });
}
