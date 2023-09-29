part of 'sign_up_provider.dart';

class SignUpNotifier extends Notifier<SignUpState> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailField = TextEditingController();

  @override
  SignUpState build() {
    return SignUpState(isDisabled: true);
  }

  void _enableButton() {
    state = SignUpState(isDisabled: false);
  }

  void _disableButton() {
    state = SignUpState(isDisabled: true);
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
