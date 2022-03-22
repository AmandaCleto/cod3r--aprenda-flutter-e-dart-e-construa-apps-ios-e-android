import 'dart:math';

import 'field.dart';

class Board {
  final int rows;
  final int columns;
  final int quantityOfBombs;

  final List<Field> _fields = [];

  Board({
    required this.rows,
    required this.columns,
    required this.quantityOfBombs,
  }) {
    _createFields();
    _relateNeighbors();
    _sortMines();
  }

  void restart() {
    _fields.forEach((field) => field.restart());
    _sortMines();
  }

  void revealBombs() {
    _fields.forEach((field) => field.revealBomb());
  }

  void _createFields() {
    for (var row = 0; row < rows; row++) {
      for (var column = 0; column < columns; column++) {
        _fields.add(Field(row: row, column: column));
      }
    }
  }

  void _relateNeighbors() {
    for (var field in _fields) {
      for (var neighbor in _fields) {
        field.addNeighbors(neighbor);
      }
    }
  }

  void _sortMines() {
    int sorted = 0;

    if (quantityOfBombs > rows * columns) {
      return;
    }

    while (sorted < quantityOfBombs) {
      int randomNumber = Random().nextInt(_fields.length);

      if (!_fields[randomNumber].mined) {
        sorted++;
        _fields[randomNumber].toMine();
      }
    }
  }

  List<Field> get fields {
    return _fields;
  }

  bool get solvedBoard {
    int _totalOpened = 0;
    int _totalMustBeOpenedToWin = (columns * rows) - quantityOfBombs;

    for (var field in _fields) {
      _totalOpened += field.open ? 1 : 0;
      if (_totalOpened == _totalMustBeOpenedToWin) {
        return true;
      }
    }

    return _fields.every((field) => field.solvedSpot);
  }
}
