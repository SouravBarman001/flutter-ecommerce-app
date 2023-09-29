
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part './sign_up_notifier.dart';
part './sign_up_state.dart';

final signUpProvider =
NotifierProvider<SignUpNotifier, SignUpState>(SignUpNotifier.new);
