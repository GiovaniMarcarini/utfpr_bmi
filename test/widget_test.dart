import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utfpr_bmi/main.dart';

void main() {
  testWidgets('Word Reverser navigation test', (WidgetTester tester) async {
    // Carregar o app
    await tester.pumpWidget(const WordReverserApp());

    // Digitar uma palavra
    await tester.enterText(find.byType(TextField), 'hello');

    // Aperta o botão
    await tester.tap(find.text('Inverta a Palavra'));

    // Aguardar a navegação e a renderização da próxima tela
    await tester.pumpAndSettle();

    // Verificar se a palavra invertida é exibida
    expect(find.text('Palavra Invertida: olleh'), findsOneWidget);
  });
}
