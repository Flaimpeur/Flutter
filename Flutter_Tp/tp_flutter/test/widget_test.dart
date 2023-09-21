import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tp_flutter/main.dart'; // Assurez-vous d'ajuster l'import en fonction de votre structure de projet.

void main() {
  testWidgets('Hangman Game Test', (WidgetTester tester) async {
    await tester.pumpWidget(TpFinal());

    // Verify that the "Start New Game" button is displayed.
    expect(find.text('Start New Game'), findsOneWidget);

    // Tap the "Start New Game" button.
    await tester.tap(find.text('Start New Game'));
    await tester.pump();

    // Verify that the "Attempts Left: 6" text is displayed.
    expect(find.text('Attempts Left: 6'), findsOneWidget);

    // Verify that the initial word display has underscores.
    expect(find.text('_ _ _ _ _ _'), findsOneWidget);

    // Tap a letter button (e.g., 'A').
    await tester.tap(find.text('A'));
    await tester.pump();

    // Verify that the guessed letter 'A' is displayed.
    expect(find.text('A'), findsOneWidget);

    // Verify that the "Attempts Left" text is updated.
    expect(find.text('Attempts Left: 5'), findsOneWidget);

    // Verify that the word display is still mostly underscores.
    expect(find.text('_ _ _ _ _ _'), findsOneWidget);

    // Continue testing other game interactions as needed.

    // For example, you can continue tapping letters and checking the game state.

    // Remember to check for game win and game over conditions as well.

    // For game win, you can check if a congratulatory message is displayed.

    // For game over, you can check if a "Game Over" message is displayed.

    // Make sure to test different game scenarios.

  });
}
