import 'package:get/get.dart';

import '../utils/bindings.dart';
import '../view/screens/main_screen.dart';

class AppRoutes {
  static const String _home = '/';

  static String get home => _home;

  static navigate(String query) {
    Get.toNamed(query);
  }

  static final List<GetPage> getPages = [
    GetPage(
        name: _home,
        page: () => HomeScreen(),
        transition: Transition.rightToLeft,
        bindings: [
          HomeScreenControllerBiding(),
        ]),
  ];
}
