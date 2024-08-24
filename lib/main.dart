import 'package:flutter/material.dart';

void main() {
  runApp(WordReverserApp());
}

class WordReverserApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inversor de Palavras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WordInputScreen(),
    );
  }
}

class WordInputScreen extends StatefulWidget {
  @override
  _WordInputScreenState createState() => _WordInputScreenState();
}

class _WordInputScreenState extends State<WordInputScreen> {
  final _wordController = TextEditingController();

  void _reverseWord() {
    final word = _wordController.text;
    if (word.isNotEmpty) {
      final reversedWord = reverseString(word);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WordResultScreen(reversedWord: reversedWord),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text('Inversor de Palavras'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _wordController,
              decoration: InputDecoration(labelText: 'Insira a Palavra'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _reverseWord,
              child: Text('Inverta a Palavra'),
            ),
          ],
        ),
      ),
    );
  }
}

class WordResultScreen extends StatelessWidget {
  final String reversedWord;

  WordResultScreen({required this.reversedWord});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Palavra Invertida'),
      ),
      body: Center(
        child: Text(
          'Palavra Invertida: $reversedWord',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

String reverseString(String word) {
  return word.split('').reversed.join('');
}