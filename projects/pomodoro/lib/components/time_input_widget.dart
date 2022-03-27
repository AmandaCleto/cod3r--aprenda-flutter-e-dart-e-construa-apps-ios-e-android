import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class TimeInputWidget extends StatelessWidget {
  final int value;
  final String title;
  final void Function()? inc;
  final void Function()? dec;

  const TimeInputWidget({
    Key? key,
    required this.value,
    required this.title,
    this.inc,
    this.dec,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 25),
        ),
        const SizedBox(
          height: 10,
        ),
        Observer(builder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: dec,
                child: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15),
                  primary: store.isWorking() ? Colors.red : Colors.green,
                ),
              ),
              Text(
                '${value.toString()} min',
                style: const TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                onPressed: inc,
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15),
                  primary: store.isWorking() ? Colors.red : Colors.green,
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
