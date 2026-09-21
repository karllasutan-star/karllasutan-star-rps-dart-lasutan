import 'dart:io';

/// Checks if the move is valid.
String? checkpoint(String? input) {
  List<String> moves = ['rock', 'paper', 'scissors'];

  String chosen = input?.trim().toLowerCase() ?? '';

  if (moves.contains(chosen)) {
    return chosen;
  }

  return null;
}

/// Checkpoint to know if it's valid  move
String whatmove(String player) {
  while (true) {
    stdout.write('$player, enter your move: ');
    String? input = stdin.readLineSync();

    String? move = checkpoint(input);

    if (move != null) {
      return move;
    }

    print('Invalid move. Try again.');
  }
}

/// Decides who wins.
String? Whowon(String move1, String move2, String player1, String player2) {
  if (move1 == move2) {
    return null;
  }

  if (move1 == 'rock' && move2 == 'scissors' ||
      move1 == 'paper' && move2 == 'rock' ||
      move1 == 'scissors' && move2 == 'paper') {
    return player1;
  }

  return player2;
}

/// Asks if the players want to play agai
bool playmore() {
  stdout.write('Want to play again? (y/n): ');
  String? userin = stdin.readLineSync();

  return userin?.trim().toLowerCase() == 'y';
}

void main() {
  print('===== ROCK, PAPER, SCISSORS =====');

  stdout.write('Enter Player 1 name: ');
  String player1 = stdin.readLineSync()?.trim() ?? 'Player 1';

  if (player1.isEmpty) {
    player1 = 'Player 1';
  }

  stdout.write('Enter Player 2 name: ');
  String player2 = stdin.readLineSync()?.trim() ?? 'Player 2';

  if (player2.isEmpty) {
    player2 = 'Player 2';
  }

  int score1 = 0;
  int score2 = 0;
  int round = 1;

  do {
    print('<<<<< Round $round >>>>>');

    String move1 = whatmove(player1);

    // Hides player 1 move
    for (int i = 0; i < 30; i++) {
      print('');
    }

    String move2 = whatmove(player2);

    print('$player1 chose $move1.');
    print('$player2 chose $move2.');

    String? winner = Whowon(move1, move2, player1, player2);

    if (winner == player1) {
      score1++;
    } else if (winner == player2) {
      score2++;
    }

    print('Result: ${winner ?? "Its a draw!"}');
    print('Score -> $player1: $score1 | $player2: $score2');

    round++;
  } while (playmore());

  print('<<<<< FINAL SCORE >>>>>>');
  print('$player1: $score1 | $player2: $score2');

  if (score1 > score2) {
    print('Overall winner: $player1');
  } else if (score2 > score1) {
    print('Overall winner: $player2');
  } else {
    print('Overall winner: Its a draw!');
  }
}
