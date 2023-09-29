part of './sign_up_provider.dart';

class SignUpState {
  SignUpState({
    required this.isDisabled,
    this.isEmailValid,
  });

  final bool isDisabled;
  final String? isEmailValid;

  SignUpState copyWith({
    bool? isDisabled,
    String? isEmailValid,
  }) {
    return SignUpState(
      isDisabled: isDisabled ?? this.isDisabled,
      isEmailValid: isEmailValid ?? this.isEmailValid,
    );
  }
}
