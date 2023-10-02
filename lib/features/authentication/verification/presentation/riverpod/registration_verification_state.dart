part of './registration_verification_provider.dart';

class RegistrationVerificationState {
  RegistrationVerificationState({
    required this.isDisabled,
  });

  final bool isDisabled;

  RegistrationVerificationState copyWith({
    bool? isDisabled,
  }) {
    return RegistrationVerificationState(
      isDisabled: isDisabled ?? this.isDisabled,
    );
  }
}
