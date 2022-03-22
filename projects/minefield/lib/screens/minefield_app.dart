import 'package:flutter/material.dart';
import 'package:minefield/components/board_widget.dart';
import 'package:minefield/components/result_widget.dart';
import 'package:minefield/models/board.dart';
import 'package:minefield/models/explosion_exception.dart';
import 'package:minefield/models/field.dart';

class MineFieldApp extends StatefulWidget {
  const MineFieldApp({Key? key}) : super(key: key);

  @override
  State<MineFieldApp> createState() => _MineFieldAppState();
}

class _MineFieldAppState extends State<MineFieldApp> {
  final int _quantityOfBombs = 1;
  bool? _won;
  Board? _board;
  int totalOfFields = 0;

  Board _getBoard({
    required double widthScreen,
    required double heightScreen,
  }) {
    if (_board == null) {
      int quantityOfColumns = 2;
      double fieldSize = widthScreen / quantityOfColumns;
      int quantityOfRows = (heightScreen / fieldSize).floor();

      totalOfFields = quantityOfRows * quantityOfColumns;

      _board = Board(
        columns: quantityOfColumns,
        rows: quantityOfRows,
        quantityOfBombs: _quantityOfBombs,
      );
    }

    return _board!;
  }

  _restart() {
    setState(() {
      _won = null;
      _board!.restart();
    });
  }

  _open(Field field) {
    if (_won != null) {
      return;
    }

    setState(() {
      try {
        field.openBomb();
        if (_board!.solvedBoard) {
          _won = true;
        }
      } on ExplosionException {
        _won = false;
        _board!.revealBombs();
      }
    });
  }

  _toggleMark(Field field) {
    if (_won != null) {
      return;
    }

    setState(() {
      field.toggleMark();
      if (_board!.solvedBoard) {
        _won = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(wonTheGame: _won, onRestartGame: _restart),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return BoardWidget(
                board: _getBoard(
                  widthScreen: constraints.maxWidth,
                  heightScreen: constraints.maxHeight,
                ),
                onOpen: _open,
                onToggleMark: _toggleMark,
              );
            },
          ),
        ),
      ),
    );
  }
}
