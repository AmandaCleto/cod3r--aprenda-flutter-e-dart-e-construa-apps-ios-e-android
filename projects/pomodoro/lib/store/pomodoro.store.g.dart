// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pomodoro.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PomodoroStore on _PomodoroStore, Store {
  Computed<bool>? _$initializedComputed;

  @override
  bool get initialized =>
      (_$initializedComputed ??= Computed<bool>(() => super.initialized,
              name: '_PomodoroStore.initialized'))
          .value;
  Computed<int>? _$minutesComputed;

  @override
  int get minutes => (_$minutesComputed ??=
          Computed<int>(() => super.minutes, name: '_PomodoroStore.minutes'))
      .value;
  Computed<int>? _$secondsComputed;

  @override
  int get seconds => (_$secondsComputed ??=
          Computed<int>(() => super.seconds, name: '_PomodoroStore.seconds'))
      .value;
  Computed<int>? _$workTimeComputed;

  @override
  int get workTime => (_$workTimeComputed ??=
          Computed<int>(() => super.workTime, name: '_PomodoroStore.workTime'))
      .value;
  Computed<int>? _$breakTimeComputed;

  @override
  int get breakTime =>
      (_$breakTimeComputed ??= Computed<int>(() => super.breakTime,
              name: '_PomodoroStore.breakTime'))
          .value;

  final _$_initializedAtom = Atom(name: '_PomodoroStore._initialized');

  @override
  bool get _initialized {
    _$_initializedAtom.reportRead();
    return super._initialized;
  }

  @override
  set _initialized(bool value) {
    _$_initializedAtom.reportWrite(value, super._initialized, () {
      super._initialized = value;
    });
  }

  final _$_minutesAtom = Atom(name: '_PomodoroStore._minutes');

  @override
  int get _minutes {
    _$_minutesAtom.reportRead();
    return super._minutes;
  }

  @override
  set _minutes(int value) {
    _$_minutesAtom.reportWrite(value, super._minutes, () {
      super._minutes = value;
    });
  }

  final _$_secondsAtom = Atom(name: '_PomodoroStore._seconds');

  @override
  int get _seconds {
    _$_secondsAtom.reportRead();
    return super._seconds;
  }

  @override
  set _seconds(int value) {
    _$_secondsAtom.reportWrite(value, super._seconds, () {
      super._seconds = value;
    });
  }

  final _$_workTimeAtom = Atom(name: '_PomodoroStore._workTime');

  @override
  int get _workTime {
    _$_workTimeAtom.reportRead();
    return super._workTime;
  }

  @override
  set _workTime(int value) {
    _$_workTimeAtom.reportWrite(value, super._workTime, () {
      super._workTime = value;
    });
  }

  final _$_breakTimeAtom = Atom(name: '_PomodoroStore._breakTime');

  @override
  int get _breakTime {
    _$_breakTimeAtom.reportRead();
    return super._breakTime;
  }

  @override
  set _breakTime(int value) {
    _$_breakTimeAtom.reportWrite(value, super._breakTime, () {
      super._breakTime = value;
    });
  }

  final _$_intervalTypeAtom = Atom(name: '_PomodoroStore._intervalType');

  @override
  EnumIntervalType get _intervalType {
    _$_intervalTypeAtom.reportRead();
    return super._intervalType;
  }

  @override
  set _intervalType(EnumIntervalType value) {
    _$_intervalTypeAtom.reportWrite(value, super._intervalType, () {
      super._intervalType = value;
    });
  }

  final _$_PomodoroStoreActionController =
      ActionController(name: '_PomodoroStore');

  @override
  void init() {
    final _$actionInfo = _$_PomodoroStoreActionController.startAction(
        name: '_PomodoroStore.init');
    try {
      return super.init();
    } finally {
      _$_PomodoroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stop() {
    final _$actionInfo = _$_PomodoroStoreActionController.startAction(
        name: '_PomodoroStore.stop');
    try {
      return super.stop();
    } finally {
      _$_PomodoroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void restart() {
    final _$actionInfo = _$_PomodoroStoreActionController.startAction(
        name: '_PomodoroStore.restart');
    try {
      return super.restart();
    } finally {
      _$_PomodoroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementWorkTime() {
    final _$actionInfo = _$_PomodoroStoreActionController.startAction(
        name: '_PomodoroStore.incrementWorkTime');
    try {
      return super.incrementWorkTime();
    } finally {
      _$_PomodoroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseWorkTime() {
    final _$actionInfo = _$_PomodoroStoreActionController.startAction(
        name: '_PomodoroStore.decreaseWorkTime');
    try {
      return super.decreaseWorkTime();
    } finally {
      _$_PomodoroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementBreakTime() {
    final _$actionInfo = _$_PomodoroStoreActionController.startAction(
        name: '_PomodoroStore.incrementBreakTime');
    try {
      return super.incrementBreakTime();
    } finally {
      _$_PomodoroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseBreakTime() {
    final _$actionInfo = _$_PomodoroStoreActionController.startAction(
        name: '_PomodoroStore.decreaseBreakTime');
    try {
      return super.decreaseBreakTime();
    } finally {
      _$_PomodoroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
initialized: ${initialized},
minutes: ${minutes},
seconds: ${seconds},
workTime: ${workTime},
breakTime: ${breakTime}
    ''';
  }
}
