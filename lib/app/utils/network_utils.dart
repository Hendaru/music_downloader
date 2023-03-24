import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';

/// returns true if network is available
Future<bool> isNetworkAvailable() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}

class NetworkController extends GetxController {
  late StreamSubscription<ConnectivityResult> connectivitySubscription;
  final isCurrentlyOnNoInternet = false.obs;

  @override
  void onInit() {
    connect();
    super.onInit();
  }

  connect() {
    connectivitySubscription = Connectivity().onConnectivityChanged.listen((e) {
      if (e == ConnectivityResult.none) {
        isCurrentlyOnNoInternet.value = true;
        toast("Not connected");
      } else {
        if (isCurrentlyOnNoInternet.value) {
          isCurrentlyOnNoInternet.value = false;
          toast("Internet is connected.");
        }
        // log('connected');
      }
    });
  }

  @override
  void onClose() {
    connectivitySubscription.cancel();
    super.onClose();
  }
}
