import 'package:flutter/material.dart';
import 'package:tictactoe/tic_tac_toe_game.dart';

class Board extends StatelessWidget {
  final TicTacToeGame game;
  final Function(int) clickedSquare;

  const Board({
    super.key,
    required this.game,
    required this.clickedSquare,
  });

  @override
  Widget build(BuildContext context) {
    var buttons = <Widget>[];
    for (int k = 0; k < 9; k++) {
      var imageFilename = "assets/images/blank.png";
      if (game.board[k] == TicTacToeMark.x) {
        imageFilename = "assets/images/x.png";
      } else if (game.board[k] == TicTacToeMark.o) {
        imageFilename = "assets/images/o.png";
      }
      buttons.add(
        InkWell(
          onTap: () {
            // print("You pressed button $k");
            clickedSquare(k);
          },
          child: Image.asset(imageFilename),
        ),
      );
    }

    return Expanded(
      child: Stack(children: [
        Image.asset("assets/images/board.png"),
        GridView.count(
          crossAxisCount: 3,
          children: buttons,
        ),
      ]),
    );
  }
}
