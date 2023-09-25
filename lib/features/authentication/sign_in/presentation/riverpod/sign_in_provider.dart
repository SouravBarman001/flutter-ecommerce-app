import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'sign_in_notifier.dart';
part 'sign_in_state.dart';

final signInProvider =
    NotifierProvider<SignInNotifier, SignInState>(SignInNotifier.new);

// StateProvider
// StateNotifierProvider (Deprecated) -> NotifierProvider / AsyncNotifierProvider
// ChangeNotifierProvider (Deprecated)
// FutureProvider
// StreamProvider
// Provider (DI)
// NotifierProvider (NEW)
// AsyncNotifierProvider (NEW)
