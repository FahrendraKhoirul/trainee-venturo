import 'package:get/get.dart';
import 'package:trainee/modules/features/navbar/modules/order/controllers/order_detail_controller.dart';

class OrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderDetailController());
  }
}
