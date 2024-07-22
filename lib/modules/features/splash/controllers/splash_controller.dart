import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trainee/configs/routes/main_route.dart';
import 'package:trainee/utils/services/local_storage_service.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  static final box = Hive.box("venturo");

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () async {
      // check session
      if (await LocalStorageService.isLogin()) {
        Get.offNamed(MainRoute.initial);
      } else {
        Get.offNamed(MainRoute.signIn);
      }
    });
  }
}
