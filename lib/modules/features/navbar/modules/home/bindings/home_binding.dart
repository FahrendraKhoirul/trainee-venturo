import 'package:get/get.dart';
import 'package:trainee/modules/features/navbar/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
