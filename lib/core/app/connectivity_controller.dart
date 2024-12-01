import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class ConnectivityController {
  ConnectivityController._();

  static ConnectivityController instance = ConnectivityController._();

  ValueNotifier<bool> isConnected = ValueNotifier<bool>(true);

  Future<void> init() async {
    final result = await Connectivity().checkConnectivity();
    isInternetConnected(result);
    Connectivity().onConnectivityChanged.listen(isInternetConnected);
  }

  bool isInternetConnected(List<ConnectivityResult> result) {
    if (result[0] == ConnectivityResult.none) {
      isConnected.value = false;
      return false;
    } else if (result[0] == ConnectivityResult.mobile ||
        result[0] == ConnectivityResult.wifi) {
      isConnected.value = true;
      return true;
    }

    return false;
  }
}
