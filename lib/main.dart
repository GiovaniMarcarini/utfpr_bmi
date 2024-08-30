import 'package:flutter/material.dart';

void main() {
  runApp(const WordReverserApp());
}

class WordReverserApp extends StatelessWidget {
  const WordReverserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inversor de Palavras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WordInputScreen(),
    );
  }
}

class WordInputScreen extends StatefulWidget {
  const WordInputScreen({super.key});

  @override
  WordInputScreenState createState() => WordInputScreenState();
}

class WordInputScreenState extends State<WordInputScreen> {
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
        title: const Text('Inversor de Palavras'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _wordController,
              decoration: const InputDecoration(labelText: 'Insira a Palavra'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _reverseWord,
              child: const Text('Inverta a Palavra'),
            ),
          ],
        ),
      ),
    );
  }
}

class WordResultScreen extends StatelessWidget {
  final String reversedWord;

  const WordResultScreen({super.key, required this.reversedWord});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Palavra Invertida'),
      ),
      body: Center(
        child: Text(
          'Palavra Invertida: $reversedWord',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

String reverseString(String word) {
  return word.split('').reversed.join('');
}
