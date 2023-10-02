import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part './timer_notifier.dart';

final timerProvider = NotifierProvider<TimerNotifier, int>
  (TimerNotifier.new,);
