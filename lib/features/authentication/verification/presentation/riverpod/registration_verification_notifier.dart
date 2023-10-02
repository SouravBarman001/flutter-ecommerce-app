

part of './registration_verification_provider.dart';

class RegistrationVerificationNotifier extends Notifier<RegistrationVerificationState>{

  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();


  @override
  RegistrationVerificationState build() {
    return RegistrationVerificationState(isDisabled: false);
  }

  void _enableButton() {
    state = RegistrationVerificationState(isDisabled: true);
  }

  void _disableButton(){
    state = RegistrationVerificationState(isDisabled: false);
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