import 'package:flutter/foundation.dart';
import 'explosion_exception.dart';

class Field {
  final int row;
  final int column;
  final List<Field> neighbors = [];

  bool _open = false;
  bool _marked = false;
  bool _mined = false;
  bool _exploded = false;

  Field({
    required this.row,
    required this.column,
  });

  void addNeighbors(Field neighbor) {
    final deltaRow = (row - neighbor.row).abs();
    final deltaColumn = (column - neighbor.column).abs();

    if (deltaRow == 0 && deltaColumn == 0) {
      return;
    }

    if (deltaRow <= 1 && deltaColumn <= 1) {
      // (2, 3) (2, 4) (2, 5)
      // (3, 3) (3, 4) (3, 5)
      // (4, 3) (4, 4) (4, 5)

      neighbors.add(neighbor);
    }
  }

  void openBomb() {
    if (_open) {
      //if already opened
      return;
    }

    _open = true;

    if (_mined) {
      _exploded = true;
      throw ExplosionException();
    }

    if (safeNeighborhood) {
      neighbors.forEach((neighbor) => neighbor.openBomb());
    }
  }

  void revealBomb() {
    if (_mined) {
      _open = true;
    }
  }

  void toMine() {
    _mined = true;
  }

  void toggleMark() {
    _marked = !_marked;
  }

  void restart() {
    _open = false;
    _marked = false;
    _mined = false;
    _exploded = false;
  }

  bool get mined {
    return _mined;
  }

  bool get exploded {
    return _exploded;
  }

  bool get open {
    return _open;
  }

  bool get marked {
    return _marked;
  }

  bool get solvedSpot {
    bool minedAndMarked = _mined && _marked;
    bool safeAndOpened = !_mined && _open;

    return minedAndMarked || safeAndOpened;
  }

  bool get safeNeighborhood {
    return neighbors.every((neighbor) => !neighbor.mined);
  }

  int get quantityOfNeighbors {
    return neighbors.where((neighbor) => neighbor.mined).length;
  }
}
