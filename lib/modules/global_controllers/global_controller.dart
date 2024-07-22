import 'dart:io';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:get/get.dart';
import 'package:trainee/configs/routes/main_route.dart';
import 'package:trainee/constants/cores/api/api_constant.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();

  var isConnect = false.obs;

  // Api
  var baseUrl = ApiConstant.production;
  var isStaging = false.obs;

  Future<void> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('space.venturo.id');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnect.value = true;
      }
    } on SocketException catch (exception, stackTrace) {
      isConnect.value = false;
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      Get.offAllNamed(MainRoute.noConnection);
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkConnection(); // Check connection on app launch
  }
}
