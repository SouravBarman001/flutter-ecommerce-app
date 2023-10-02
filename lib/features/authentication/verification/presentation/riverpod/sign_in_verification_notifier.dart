

part of './sign_in_verification_provider.dart';


class SignInVerificationNotifier extends Notifier<SignInVerificationState>{

  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();


  @override
  SignInVerificationState build() {
    return SignInVerificationState(isDisabled: false);
  }

  void _enableButton() {
    state = SignInVerificationState(isDisabled: true);
  }

  void _disableButton(){
    state = SignInVerificationState(isDisabled: false);
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