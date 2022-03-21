import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? wonTheGame;
  final Function onRestartGame;

  const ResultWidget({
    Key? key,
    required this.wonTheGame,
    required this.onRestartGame,
  }) : super(key: key);

  Color _getColor() {
    if (wonTheGame == null) {
      return Colors.yellow.shade300;
    } else if (wonTheGame == true) {
      return Colors.green.shade300;
    } else {
      return Colors.red.shade300;
    }
  }

  IconData _getIcon() {
    if (wonTheGame == null) {
      return Icons.sentiment_satisfied_alt_rounded;
    } else if (wonTheGame == true) {
      return Icons.sentiment_very_satisfied_rounded;
    } else {
      return Icons.sentiment_very_dissatisfied_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundColor: _getColor(),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                _getIcon(),
                color: Colors.black,
                size: 35.0,
              ),
              onPressed: () => onRestartGame(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
