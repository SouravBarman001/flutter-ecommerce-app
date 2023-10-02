part of './profile_and_password_provider.dart';

class ProfileAndPasswordNotifier extends Notifier<ProfileAndPasswordState> {

  final TextEditingController passwordTextField =
  TextEditingController();
  final TextEditingController referalCodeTextField =
  TextEditingController();
  final formKey = GlobalKey<FormState>();



  @override
  ProfileAndPasswordState build() {
    return ProfileAndPasswordState(
      isDisable: false,
    );
  }

  void _enableButton() {
    state = ProfileAndPasswordState(isDisable: false);
  }

  void _disableButton() {
    state = ProfileAndPasswordState(isDisable: true);
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
