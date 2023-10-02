import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part './update_password_notifier.dart';
part './update_password_state.dart';

final updatePasswordProvider =
    NotifierProvider<UpdatePasswordNotifier, UpdatePasswordState>(
        UpdatePasswordNotifier.new,);
