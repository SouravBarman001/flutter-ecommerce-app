part of '../pages/verification_page.dart';

class _TimerSection extends ConsumerStatefulWidget {
  const _TimerSection({super.key});

  @override
  ConsumerState<_TimerSection> createState() => _TimerSectionState();
}

class _TimerSectionState extends ConsumerState<_TimerSection> {

  @override
  void initState() {
    super.initState();
    ref.read(timerProvider.notifier).startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    ref.read(timerProvider.notifier).stopTimer();
  }

  @override
  Widget build(BuildContext context) {
    final secondsRemaining = ref.watch(timerProvider);

    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Strings.sendResetCode,
            style: AppTextStyle.textStyleOne(
              Colors.grey,
              13.sp,
              FontWeight.w400,
            ),
          ),
          Text(
            '${secondsRemaining ~/ 60}:'
                '${(secondsRemaining % 60).toString().
            padLeft(2, '0')}',
            style: AppTextStyle.textStyleOne(
              Colors.grey,
              13.sp,
              FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
