import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/button_timer_widget.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Observer(builder: (_) {
      return Container(
        color: store.isWorking() ? Colors.red : Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              store.isWorking() ? 'Hora de Trabalhar' : 'Hora de Descansar',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 120.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!store.initialized)
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ButtonTimerWidget(
                      icon: Icons.play_arrow,
                      text: "Iniciar",
                      click: store.init,
                    ),
                  ),
                if (store.initialized)
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ButtonTimerWidget(
                      icon: Icons.stop,
                      text: "Parar",
                      click: store.stop,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ButtonTimerWidget(
                    icon: Icons.refresh,
                    text: "Reiniciar",
                    click: store.restart,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
