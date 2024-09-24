import 'package:flutter/material.dart';
import 'package:tictactoe/board.dart';
import 'package:tictactoe/tic_tac_toe_game.dart';

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({super.key});

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  var game = TicTacToeGame();

  String getGameState() {
    switch (game.state) {
      case TicTacToeState.xTurn:
        return "X's Turn";
      case TicTacToeState.oTurn:
        return "O's Turn";
      case TicTacToeState.xWon:
        return "X Won!";
      case TicTacToeState.oWon:
        return "O Won!";
      case TicTacToeState.tie:
        return "Tie Game";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic-Tac-Toe"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 30.0,
                  top: 50,
                ),
                child: Text(
                  getGameState(),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              Board(
                game: game,
                clickedSquare: (index) {
                  // print("You pressed $index");
                  setState(() {
                    game.pressedSquare(index);
                  });
                },
              ),
              Container(
                alignment: Alignment.topRight,
                margin: const EdgeInsets.only(bottom: 30.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      game = TicTacToeGame();
                    });
                  },
                  child: const Text(
                    "New Game",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color(0xffa00000),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
