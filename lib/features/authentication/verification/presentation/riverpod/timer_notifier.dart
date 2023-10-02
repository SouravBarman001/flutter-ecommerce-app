part of './time_notifier_provider.dart';

class TimerNotifier extends Notifier<int> {
  late Timer _timer;

  @override
  int build() {
    return 60;
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        state = state - 1;
      } else {
        _timer.cancel(); // Stop the timer when it reaches 0.
      }
    });
  }

  void stopTimer() {
    _timer.cancel();
  }


}