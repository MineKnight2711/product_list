import 'package:get/get.dart';

import '../controller/mainscreen_controller.dart';

class HomeScreenControllerBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }
}
