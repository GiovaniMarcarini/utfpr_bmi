import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utfpr_bmi/main.dart';

void main() {
  testWidgets('Word Reverser navigation test', (WidgetTester tester) async {
    // Carregar o app
    await tester.pumpWidget(WordReverserApp());

    // Digitar uma palavra
    await tester.enterText(find.byType(TextField), 'hello');

    // Aperta o botão
    await tester.tap(find.text('Inverta a Palavra'));
    await tester.pumpAndSettle(); // aguardar a navegação para a próxima tela

    // Verificar se a palavra invertida é exibida
    expect(find.text('Palavra Invertida: olleh'), findsOneWidget);
  });
}