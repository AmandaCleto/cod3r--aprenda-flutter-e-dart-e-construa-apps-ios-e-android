import 'package:flutter/material.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:pomodoro/utils/sizes.dart';
import 'package:provider/provider.dart';

class ButtonIncreaseDecreaseWidget extends StatelessWidget {
  final Function()? function;
  final IconData icon;

  const ButtonIncreaseDecreaseWidget({
    Key? key,
    required this.function,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.of(context).size.width < Sizes.mobile;
    final store = Provider.of<PomodoroStore>(context);
    return ElevatedButton(
      onPressed: function,
      child: Icon(
        icon,
        color: Colors.white,
        size: isMobile ? 20.0 : 25.0,
      ),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: EdgeInsets.all(isMobile ? 10.0 : 15.0),
        primary: store.isWorking() ? Colors.red : Colors.green,
      ),
    );
  }
}
