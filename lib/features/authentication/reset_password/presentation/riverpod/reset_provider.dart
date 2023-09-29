import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part './reset_notifier.dart';
part './reset_state.dart';

final resetProvider =
NotifierProvider<ResetNotifier, ResetState>(ResetNotifier.new);