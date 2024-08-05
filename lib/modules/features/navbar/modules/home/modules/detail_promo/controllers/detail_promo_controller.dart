import 'package:get/get.dart';
import 'package:trainee/modules/features/navbar/modules/home/models/promo_model.dart';

class DetailPromoController extends GetxController {
  static DetailPromoController get to => Get.find<DetailPromoController>();

  final DataPromo arg = Get.arguments;
}
