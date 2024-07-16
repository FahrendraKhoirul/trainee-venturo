import 'package:get/get.dart';
import 'package:trainee/configs/routes/main_route.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(MainRoute.initial);
    });
  }
}
