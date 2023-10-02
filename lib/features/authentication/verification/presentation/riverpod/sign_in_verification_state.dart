part of './sign_in_verification_provider.dart';

class SignInVerificationState {
  SignInVerificationState({
    required this.isDisabled,
  });

  final bool isDisabled;

  SignInVerificationState copyWith({
    bool? isDisabled,
  }) {
    return SignInVerificationState(
      isDisabled: isDisabled ?? this.isDisabled,
    );
  }
}
