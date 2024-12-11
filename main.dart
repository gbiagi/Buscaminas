// Matriz donde se guardan las jugadas durante la partida
var playBoard = {
  "A": [0, 0, 0, 0, 0, 0, 0, 0],
  "B": [0, 0, 0, 0, 0, 0, 0, 0],
  "C": [0, 0, 0, 0, 0, 0, 0, 0],
  "D": [0, 0, 0, 0, 0, 0, 0, 0],
  "E": [0, 0, 0, 0, 0, 0, 0, 0],
  "F": [0, 0, 0, 0, 0, 0, 0, 0]
};

// Matriz donde se guardan el tablero generado
var gameBoard = {
  "A": [0, 0, 0, 0, 0, 0, 0, 0],
  "B": [0, 0, 0, 0, 0, 0, 0, 0],
  "C": [0, 0, 0, 0, 0, 0, 0, 0],
  "D": [0, 0, 0, 0, 0, 0, 0, 0],
  "E": [0, 0, 0, 0, 0, 0, 0, 0],
  "F": [0, 0, 0, 0, 0, 0, 0, 0]
};

final gameBoardKeys = gameBoard.keys.toList();

void printBoard({bool showCheat = false}) {
  // Print the gameBoard
  var firstRow = "";
  for (var i = 0; i < 8; i++) {
    firstRow = firstRow + i.toString() + " ";
  }
  if (showCheat) {
    firstRow = firstRow + '|| ' + firstRow;
  }
  print("  " + firstRow);
  for (var key in gameBoardKeys) {
    var row = gameBoard[key];
    var rowString = "";
    for (var col in row!) {
      // 0 = · por descubrir, 1 = * bomba, 2 = # bandera.
      if (col == 0) {
        rowString = rowString + "· ";
      } else if (col == 1) {
        rowString = rowString + "* ";
      } else if (col == 2) {
        rowString = rowString + "# ";
      } else {
        rowString = rowString + col.toString() + " ";
      }
    }
    if (showCheat) {
      rowString = rowString + '|| ' + key + " ";
      for (var col in playBoard[key]!) {
        rowString = rowString + col.toString() + " ";
      }
    }
    print("$key $rowString");
  }
}

void occupyBoard() {
  var bombCountLimit = 8;
  // Rellenar el tablero con bombas de forma aleatoria
  for (var key in gameBoardKeys) {
    var row = gameBoard[key];
    for (var i = 0; i < row!.length; i++) {
      if (bombCountLimit > 0 && (i % 2 == 0 || i % 3 == 0)) {
        row[i] = 1;
        bombCountLimit--;
      }
    }
  }
}

void main() {
  printBoard(showCheat: true);
}
