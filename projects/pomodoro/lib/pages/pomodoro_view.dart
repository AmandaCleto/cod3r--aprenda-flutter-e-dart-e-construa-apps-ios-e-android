import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/time_input_widget.dart';
import 'package:pomodoro/components/timer_widget.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class PomodoroView extends StatelessWidget {
  const PomodoroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: TimerWidget(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Observer(builder: (context) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TimeInputWidget(
                    value: store.workTime,
                    title: 'Trabalho',
                    inc: store.initialized && store.isWorking()
                        ? null
                        : store.incrementWorkTime,
                    dec: store.initialized && store.isWorking()
                        ? null
                        : store.decreaseWorkTime,
                  ),
                  TimeInputWidget(
                    value: store.breakTime,
                    title: 'Descanso',
                    inc: store.initialized && store.isHavingABreak()
                        ? null
                        : store.incrementBreakTime,
                    dec: store.initialized && store.isHavingABreak()
                        ? null
                        : store.decreaseBreakTime,
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}
