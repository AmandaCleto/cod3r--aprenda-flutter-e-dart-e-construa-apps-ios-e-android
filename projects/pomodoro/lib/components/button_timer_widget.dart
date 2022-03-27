import 'package:flutter/material.dart';

class ButtonTimerWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? click;

  const ButtonTimerWidget({
    Key? key,
    required this.icon,
    required this.text,
    this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        textStyle: const TextStyle(fontSize: 25.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              icon,
              size: 35.0,
            ),
          ),
          Text(text),
        ],
      ),
      onPressed: click,
    );
  }
}
