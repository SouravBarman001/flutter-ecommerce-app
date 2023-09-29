part of 'reset_provider.dart';

class ResetNotifier extends Notifier<ResetState> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailField = TextEditingController();

  @override
  ResetState build() {
    return ResetState(isDisabled: true);
  }

  void _enableButton() {
    state = ResetState(isDisabled: false);
  }

  void _disableButton() {
    state = ResetState(isDisabled: true);
  }

  Future<void> validate() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final isFormValid = formKey.currentState!.validate();
    await HapticFeedback.mediumImpact();

    if (isFormValid) {
      _enableButton();
    } else {
      _disableButton();
    }
  }
}
