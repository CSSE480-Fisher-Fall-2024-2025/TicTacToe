// ignore_for_file: avoid_print

enum TicTacToeMark { none, x, o }

enum TicTacToeState { xTurn, oTurn, xWon, oWon, tie }

class TicTacToeGame {
  var board = List<TicTacToeMark>.filled(9, TicTacToeMark.none);
  var state = TicTacToeState.xTurn;

  String get stateString => state.toString().split(".").last;

  String get boardString {
    var result = "";
    for (var mark in board) {
      // Option #1 - Switch statement
      // switch (mark) {
      //   case TicTacToeMark.x:
      //     result += "X";
      //     break;
      //   case TicTacToeMark.none:
      //     result += "-";
      //     break;
      //   case TicTacToeMark.o:
      //     result += "O";
      //     break;
      // }

      // Option #2 - if statement
      // if (mark == TicTacToeMark.x) {
      //   result += "X";
      // } else if (mark == TicTacToeMark.o) {
      //   result += "O";
      // } else {
      //   result += "-";
      // }

      // Option #3 - something else
      result +=
          mark == TicTacToeMark.x ? "X" : (mark == TicTacToeMark.o ? "O" : "-");
    }
    return result;
  }

  @override
  String toString() {
    return "$stateString $boardString";
  }

  void pressedSquare(int index) {
    if (index < 0 || index > 8) {
      return; // invalid input
    }
    if (board[index] != TicTacToeMark.none) {
      return; // square is not available.
    }
    if (state == TicTacToeState.xTurn) {
      board[index] = TicTacToeMark.x;
      state = TicTacToeState.oTurn;
    } else if (state == TicTacToeState.oTurn) {
      board[index] = TicTacToeMark.o;
      state = TicTacToeState.xTurn;
    } else {
      return; // Not allowed to take more turns, this game is over.
    }
    checkForWin();
  }

  void checkForWin() {
    // Check for ties first.
    if (!board.contains(TicTacToeMark.none)) {
      state = TicTacToeState.tie;
    }
    // Check for wins second (can override ties)
    var linesOf3 = [];
    linesOf3.add(_stringFromIndices(0, 1, 2));
    linesOf3.add(_stringFromIndices(3, 4, 5));
    linesOf3.add(_stringFromIndices(6, 7, 8));
    linesOf3.add(_stringFromIndices(0, 3, 6));
    linesOf3.add(_stringFromIndices(1, 4, 7));
    linesOf3.add(_stringFromIndices(2, 5, 8));
    linesOf3.add(_stringFromIndices(0, 4, 8));
    linesOf3.add(_stringFromIndices(2, 4, 6));
    for (var lineOf3 in linesOf3) {
      if (lineOf3 == "XXX") {
        state = TicTacToeState.xWon;
      } else if (lineOf3 == "OOO") {
        state = TicTacToeState.oWon;
      }
    }
  }

  String _stringFromIndices(int a, int b, int c) =>
      boardString[a] + boardString[b] + boardString[c];
}

// void main() {
//   print("Quick and dirty testing (pre-unit testing)");
//   TicTacToeMark mark = TicTacToeMark.x;
//   print(mark);
//   var state = TicTacToeState.xWon;
//   print(state);
//   var game = TicTacToeGame();
//   game.board[4] = TicTacToeMark.x;
//   game.board[8] = TicTacToeMark.o;
//   print(game);
// }
