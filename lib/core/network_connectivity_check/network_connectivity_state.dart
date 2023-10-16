enum ConnectivityStatus { notDetermined, isConnected, isDisconnected }

class ConnectivityState<T> {
  ConnectivityState({
    this.connectivityStatus,
    this.message,
    this.data,
  });

  ConnectivityState.initial()
      : connectivityStatus = ConnectivityStatus.isConnected,
        message = null,
        data = null;

  ConnectivityState.disconnected()
      : connectivityStatus = ConnectivityStatus.isDisconnected,
        message = null,
        data = null;

  ConnectivityState.notDetermined()
      : connectivityStatus = ConnectivityStatus.notDetermined,
        message = null,
        data = null;



  final ConnectivityStatus? connectivityStatus;
  final String? message;
  final T? data;

  ConnectivityState<T> copyWith({
    ConnectivityStatus? connectivityStatus,
    String? message,
    T? data,
  }) {
    return ConnectivityState<T>(
      connectivityStatus: connectivityStatus ?? this.connectivityStatus,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
