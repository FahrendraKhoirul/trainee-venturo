import 'package:get/get.dart';
import 'package:trainee/modules/features/counter/controllers/counter_controller.dart';

class CounterBindding implements Bindings {
  @override
  void dependencies() {
    Get.put(CounterController());
  }
}
