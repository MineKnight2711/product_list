import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionController extends GetxController {
  RxInt timesConnectedDisconnected = 0.obs;

  StreamSubscription<InternetConnectionStatus> listenToInternetChange(
      Function()? onReconnect) {
    return InternetConnectionChecker().onStatusChange.listen(
      (status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            timesConnectedDisconnected.value++;
            if (timesConnectedDisconnected.value > 1) {
              Get.snackbar("Info", "Internet has restored!");
              onReconnect;
            }
            break;
          case InternetConnectionStatus.disconnected:
            timesConnectedDisconnected.value++;
            Get.snackbar("Warning!", "Lost connect to the internet !");
            break;
        }
      },
    );
  }
}
