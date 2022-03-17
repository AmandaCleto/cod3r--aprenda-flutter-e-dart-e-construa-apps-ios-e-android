import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const darkColor = Color.fromRGBO(82, 82, 82, 1);
  static const defaultColor = Color.fromRGBO(112, 112, 112, 1);
  static const operationColor = Color.fromRGBO(250, 158, 13, 1);

  final String text;
  final bool big;
  final Color color;
  final void Function(String) cb;

  const Button({
    Key? key,
    required this.text,
    this.big = false,
    this.color = defaultColor,
    required this.cb,
  }) : super(key: key);

  const Button.big({
    Key? key,
    required this.text,
    this.big = true,
    this.color = defaultColor,
    required this.cb,
  }) : super(key: key);

  const Button.operation({
    Key? key,
    required this.text,
    this.big = false,
    this.color = operationColor,
    required this.cb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: ElevatedButton(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w200,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
        onPressed: () => cb(text),
      ),
    );
  }
}
