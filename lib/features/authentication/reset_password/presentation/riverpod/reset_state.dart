part of './reset_provider.dart';

class ResetState {
  ResetState({
    required this.isDisabled,
  });

  final bool isDisabled;

  ResetState copyWith({
    bool? isDisabled,

  }) {
    return ResetState(
      isDisabled: isDisabled ?? this.isDisabled,

    );
  }
}
