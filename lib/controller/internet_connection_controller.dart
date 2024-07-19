import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionController extends GetxController {
  RxInt timesConnectedDisconnected = 0.obs;
  @override
  void onInit() {
    super.onInit();
    listenToInternetChange();
  }

  void listenToInternetChange() {
    InternetConnectionChecker().onStatusChange.listen(
      (status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            timesConnectedDisconnected.value++;
            if (timesConnectedDisconnected.value > 1) {
              Get.snackbar("Info", "Internet has restored!");
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
