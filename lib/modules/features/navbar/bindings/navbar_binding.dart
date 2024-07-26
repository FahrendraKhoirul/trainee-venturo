import 'package:get/get.dart';
import 'package:trainee/modules/features/navbar/controllers/navbar_controller.dart';

class NavbarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NavbarController());
  }
}
