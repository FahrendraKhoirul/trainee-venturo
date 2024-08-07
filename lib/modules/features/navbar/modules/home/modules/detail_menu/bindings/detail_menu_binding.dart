import 'package:get/get.dart';
import 'package:trainee/modules/features/navbar/modules/home/modules/detail_menu/controllers/detail_menu_controller.dart';

class DetailMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailMenuController());
  }
}