import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/button_increase_decrease_widget.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:pomodoro/utils/sizes.dart';
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
    var isMobile = MediaQuery.of(context).size.width < Sizes.mobile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 20.0 : 25.0,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Observer(
          builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonIncreaseDecreaseWidget(
                  function: dec,
                  icon: Icons.arrow_downward,
                ),
                Text(
                  '${value.toString()} min',
                  style: const TextStyle(fontSize: 18),
                ),
                ButtonIncreaseDecreaseWidget(
                  function: inc,
                  icon: Icons.arrow_upward,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
