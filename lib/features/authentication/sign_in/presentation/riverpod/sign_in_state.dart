part of 'sign_in_provider.dart';

class SignInState {
  SignInState({
    required this.isDisabled,
    this.isEmailValid,
  });

  final bool isDisabled;
  final String? isEmailValid;

  SignInState copyWith({
    bool? isDisabled,
    String? isEmailValid,
  }) {
    return SignInState(
      isDisabled: isDisabled ?? this.isDisabled,
      isEmailValid: isEmailValid ?? this.isEmailValid,
    );
  }
}
