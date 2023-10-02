part of './update_password_provider.dart';

class UpdatePasswordNotifier extends Notifier<UpdatePasswordState> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordFieldOne = TextEditingController();
  final TextEditingController passwordFieldTwo = TextEditingController();

  @override
  UpdatePasswordState build() {
    return UpdatePasswordState(isDisabled: true);
  }

  void _enableButton() {

      state = UpdatePasswordState(isDisabled: false);
  }

  void _disableButton() {
    state = UpdatePasswordState(isDisabled: true);
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
