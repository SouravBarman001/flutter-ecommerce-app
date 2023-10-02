import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part './sign_in_verification_notifier.dart';
part './sign_in_verification_state.dart';

final signInVerificationProvider = NotifierProvider<
    SignInVerificationNotifier, SignInVerificationState>(
  SignInVerificationNotifier.new,
);
