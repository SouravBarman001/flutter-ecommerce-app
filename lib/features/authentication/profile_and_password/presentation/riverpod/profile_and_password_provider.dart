import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part './profile_and_password_notifier.dart';
part './profile_and_password_state.dart';

final profileAndPasswordProvider =
    NotifierProvider<ProfileAndPasswordNotifier, ProfileAndPasswordState>(
        ProfileAndPasswordNotifier.new,);
