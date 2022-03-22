import 'package:flutter/material.dart';
import 'package:minefield/models/field.dart';

class FieldWidget extends StatelessWidget {
  final Field field;
  final void Function(Field) onOpen;
  final void Function(Field) onToggleMark;

  const FieldWidget({
    Key? key,
    required this.field,
    required this.onOpen,
    required this.onToggleMark,
  }) : super(key: key);

  Widget _getImage() {
    int quantityOfMines = field.quantityOfMinedNeighbors;

    if (field.open && field.mined && field.exploded) {
      return Image.asset('assets/images/bomb_0.jpeg');
    } else if (field.open && field.mined) {
      return Image.asset('assets/images/bomb_1.jpeg');
    } else if (field.open) {
      return Image.asset('assets/images/open_$quantityOfMines.jpeg');
    } else if (field.marked) {
      return Image.asset('assets/images/flag.jpeg');
    } else {
      return Image.asset('assets/images/close.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(field),
      onLongPress: () => onToggleMark(field),
      child: _getImage(),
    );
  }
}
