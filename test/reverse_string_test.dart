import 'package:flutter_test/flutter_test.dart';
import 'package:utfpr_bmi/main.dart';

void main() {
  test('String reversal should be correct', () {
    expect(reverseString("hello"), "olleh");
    expect(reverseString("flutter"), "rettulf");
    expect(reverseString("dart"), "trad");
  });

  test('String reversal should handle empty string', () {
    expect(reverseString(""), "");
  });
}
