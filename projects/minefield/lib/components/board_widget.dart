import 'package:flutter/material.dart';
import 'package:minefield/components/field_widget.dart';
import 'package:minefield/models/board.dart';
import 'package:minefield/models/field.dart';

class BoardWidget extends StatelessWidget {
  final Board board;
  final void Function(Field) onOpen;
  final void Function(Field) onToggleMark;

  const BoardWidget({
    Key? key,
    required this.board,
    required this.onOpen,
    required this.onToggleMark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.count(
        crossAxisCount: board.columns,
        children: board.fields.map((field) {
          return FieldWidget(
            field: field,
            onOpen: onOpen,
            onToggleMark: onToggleMark,
          );
        }).toList(),
      ),
    );
  }
}
