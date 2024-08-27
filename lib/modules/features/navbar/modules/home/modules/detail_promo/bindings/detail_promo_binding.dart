import 'package:get/get.dart';
import 'package:trainee/modules/features/navbar/modules/home/modules/detail_promo/controllers/detail_promo_controller.dart';

class DetailPromoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailPromoController());
  }
}
