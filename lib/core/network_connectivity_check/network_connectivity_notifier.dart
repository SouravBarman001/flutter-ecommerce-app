import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core/core.dart';
import 'package:ecommerce_module/core/network_connectivity_check/network_connectivity_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectivityStatusNotifier extends Notifier<ConnectivityState> {
  late final StreamSubscription subscription;
  @override
  ConnectivityState build() {
    return ConnectivityState.notDetermined();
  }

  void checkStatus() {
    subscription = Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        state = ConnectivityState.initial();
        Log.debug('internet connected');
      } else if (event == ConnectivityResult.none) {
        state = ConnectivityState.disconnected();
        Log.debug('no internet connection');
      }
    });
  }

  void dispose() {
    subscription.cancel();
  }
}
