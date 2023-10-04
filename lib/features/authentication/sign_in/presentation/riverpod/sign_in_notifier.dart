part of 'sign_in_provider.dart';

class SignInNotifier extends Notifier<SignInState> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailField = TextEditingController();
  final TextEditingController passwordField = TextEditingController();

  @override
  SignInState build() {
    return SignInState(isDisabled: true);
  }

  void _enableButton() {
    state = SignInState(isDisabled: false);
  }

  void _disableButton() {
    state = SignInState(isDisabled: true);
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
