part  of './update_password_provider.dart';

class UpdatePasswordState {
  UpdatePasswordState({
    required this.isDisabled,
  });

  final bool isDisabled;

  UpdatePasswordState copyWith({
    bool? isDisabled,
  }) {
    return UpdatePasswordState(
      isDisabled: isDisabled ?? this.isDisabled,
    );
  }
}
