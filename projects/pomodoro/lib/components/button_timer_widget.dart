import 'package:flutter/material.dart';
import 'package:pomodoro/utils/sizes.dart';

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
    var isMobile = MediaQuery.of(context).size.width < Sizes.mobile;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: isMobile ? 15.0 : 30.0,
        ),
        textStyle: TextStyle(
          fontSize: isMobile ? 20.0 : 25.0,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              icon,
              size: isMobile ? 20.0 : 35.0,
            ),
          ),
          Text(text),
        ],
      ),
      onPressed: click,
    );
  }
}
