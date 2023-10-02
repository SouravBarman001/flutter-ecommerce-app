import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part './registration_verification_notifier.dart';
part './registration_verification_state.dart';

final registrationVerificationProvider = NotifierProvider<
    RegistrationVerificationNotifier, RegistrationVerificationState>(
  RegistrationVerificationNotifier.new,
);
