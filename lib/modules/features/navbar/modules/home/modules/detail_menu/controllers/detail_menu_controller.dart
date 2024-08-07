import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:trainee/modules/features/navbar/modules/home/modules/detail_menu/models/detail_menu_model.dart';
import 'package:trainee/modules/global_models/menu_model.dart';
import 'package:trainee/modules/global_repositories/menu_repository.dart';

class DetailMenuController extends GetxController {
  static DetailMenuController get to => Get.find<DetailMenuController>();

  final MenuModel arg = Get.arguments;
  final Rx<DetailMenuAPIModel> detailMenu = DetailMenuAPIModel().obs;
  final isLoading = true.obs;
  final RxInt selectedLevel = 0.obs;
  final RxInt selectedTopping = 0.obs;
  final RxInt itemQuantity = 1.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getDetailMenu();
  }

  // ======== DETAIL MENU Section ===========
  Future<void> getDetailMenu() async {
    try {
      isLoading.value = true;
      DetailMenuAPIModel detailMenuAPIModel =
          await MenuRepository.getMenuDetail(arg.idMenu!);
      detailMenu.value = detailMenuAPIModel;
      isLoading.value = false;
    } catch (exception, stacktrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stacktrace,
      );
      isLoading.value = false;
    }
  }

  void setSelectedLevel(int index) {
    selectedLevel.value = index;
  }

  void setSelectedTopping(int index) {
    selectedTopping.value = index;
  }

  void incrementQuantity() {
    itemQuantity.value++;
  }

  void decrementQuantity() {
    if (itemQuantity.value > 1) {
      itemQuantity.value--;
    }
  }
}
