import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(TpFinal());
}

class TpFinal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Jeu du pendu'),
        ),
        body: TpFinalScreen(),
      ),
    );
  }
}

class TpFinalScreen extends StatefulWidget {
  @override
  _TpFinalScreenState createState() => _TpFinalScreenState();
}

class _TpFinalScreenState extends State<TpFinalScreen> {
  final List<String> words = [
    'FLUTTER',
    'DEVELOPPEUR',
    'CUISINER',
    'MANGER',
    'BAGUETTE',
    'PERSONNE',
    'AGRICULTEUR',
    'BOURLINGUER',
    'AMANDE',
    'JEU',
    'BOIRE',
    'VOIR',
    'EAU',
    'POUTRE',
    'RADIOACTIF',
  ];

  String wordToGuess = '';
  List<String> guessedLetters = [];
  int attemptsLeft = 10;

  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  void startNewGame() {
    final random = Random();
    wordToGuess = words[random.nextInt(words.length)];
    guessedLetters.clear();
    attemptsLeft = 10;
  }

  bool isGameWon() {
    for (var letter in wordToGuess.split('')) {
      if (!guessedLetters.contains(letter)) {
        return false;
      }
    }
    return true;
  }

  void checkGameStatus() {
    if (isGameWon()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Victoire !'),
          content: Text('Bien jouer, vous avez gagnez et trouver le mot ! BRAVO !!!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                startNewGame();
              },
              child: Text('Rejouer'),
            ),
          ],
        ),
      );
    }

    if (attemptsLeft == 0) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Perdu'),
          content: Text('Oups on dirais que vous avez utilisé tout vos coup sans trouver le mot mince. Le mot était: $wordToGuess'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                startNewGame();
              },
              child: Text('Rejouer'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Coup restant: $attemptsLeft',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 15),
            Text(
              'Mot à deviner:',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              wordToGuess.split('').map((letter) {
                if (guessedLetters.contains(letter)) {
                  return letter;
                } else {
                  return '_';
                }
              }).join(' '),
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 30),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: 26,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final letter = String.fromCharCode('A'.codeUnitAt(0) + index);
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (!guessedLetters.contains(letter)) {
                        guessedLetters.add(letter);
                        if (!wordToGuess.contains(letter)) {
                          attemptsLeft--;
                        }
                      }

                      checkGameStatus();
                    });
                  },
                  child: Text(letter),
                );
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  startNewGame();
                });
              },
              child: Text('Nouvelle partie'),
            ),
          ],
        ),
      ),
    );
  }
}
