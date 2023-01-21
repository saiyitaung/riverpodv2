import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NetworkStatus { on, off, unknown }

class NetworkStateNotifier extends StateNotifier<NetworkStatus> {
  StreamController<ConnectivityResult> controller =
      StreamController<ConnectivityResult>();
  late NetworkStatus lastResult;
  NetworkStateNotifier() : super(NetworkStatus.unknown) {
    lastResult = NetworkStatus.unknown;
    Connectivity().onConnectivityChanged.listen((event) {
      NetworkStatus newState;
      switch (event) {
        case ConnectivityResult.mobile:
        case ConnectivityResult.wifi:
          newState = NetworkStatus.on;
          break;
        case ConnectivityResult.none:
          newState = NetworkStatus.off;
          break;
        default:
          newState = NetworkStatus.unknown;
          break;
      }
      if (newState != state) {
        state = newState;
      }
    });
  }
}
