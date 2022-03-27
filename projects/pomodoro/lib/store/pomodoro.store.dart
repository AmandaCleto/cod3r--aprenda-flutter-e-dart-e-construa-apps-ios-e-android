import 'dart:async';
import 'dart:developer';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum EnumIntervalType { BREAK, WORK }

abstract class _PomodoroStore with Store {
  // ts = decorator
  // java = annotation

  @observable
  bool _initialized = false;

  @observable
  int _minutes = 2;

  @observable
  int _seconds = 58;

  @observable
  int _workTime = 2;

  @observable
  int _breakTime = 1;

  @observable
  EnumIntervalType _intervalType = EnumIntervalType.BREAK;

  @computed
  bool get initialized => _initialized;

  @computed
  int get minutes => _minutes;

  @computed
  int get seconds => _seconds;

  @computed
  int get workTime => _workTime;

  @computed
  int get breakTime => _breakTime;

  Timer? _timer;

  @action
  void init() {
    _initialized = true;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_timer) {
        if (_minutes == 0 && _seconds == 0) {
          _changeIntervalType();
        } else {
          if (_seconds == 0) {
            _seconds = 59;
            _minutes--;
          } else {
            _seconds--;
          }
        }
      },
    );
  }

  @action
  void stop() {
    _initialized = false;
    _timer?.cancel();
  }

  @action
  void restart() {
    stop();
    _minutes = isWorking() ? _workTime : _breakTime;
    _seconds = 0;
  }

  @action
  void incrementWorkTime() {
    _workTime++;

    if (isWorking()) {
      restart();
    }
  }

  @action
  void decreaseWorkTime() {
    if (_workTime > 1) {
      _workTime--;
      if (isWorking()) {
        restart();
      }
    }
  }

  @action
  void incrementBreakTime() {
    _breakTime++;
    if (isHavingABreak()) {
      restart();
    }
  }

  @action
  void decreaseBreakTime() {
    if (_breakTime > 1) {
      _breakTime--;
      if (isHavingABreak()) {
        restart();
      }
    }
  }

  bool isWorking() {
    return _intervalType == EnumIntervalType.WORK;
  }

  bool isHavingABreak() {
    return _intervalType == EnumIntervalType.BREAK;
  }

  void _changeIntervalType() {
    if (isWorking()) {
      _intervalType = EnumIntervalType.BREAK;
      _minutes = _breakTime;
    } else {
      _intervalType = EnumIntervalType.WORK;
      _minutes = _workTime;
    }

    _seconds = 0;
  }
}
