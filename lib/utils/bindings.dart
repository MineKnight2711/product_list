import 'package:get/get.dart';
import 'package:product_list/controller/internet_connection_controller.dart';

import '../controller/mainscreen_controller.dart';

class HomeScreenControllerBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
    Get.put(InternetConnectionController());
  }
}
