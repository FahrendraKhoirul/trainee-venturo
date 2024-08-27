import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:trainee/configs/themes/main_color.dart';
import 'package:trainee/modules/features/navbar/modules/home/modules/detail_menu/models/detail_menu_model.dart';
import 'package:trainee/modules/global_models/menu_model.dart';
import 'package:trainee/modules/global_repositories/menu_repository.dart';
import 'package:trainee/shared/styles/google_text_style.dart';

class DetailMenuController extends GetxController {
  static DetailMenuController get to => Get.find<DetailMenuController>();

  final MenuModel arg = Get.arguments;
  final Rx<DetailMenuAPIModel> detailMenu = DetailMenuAPIModel().obs;
  final isLoading = true.obs;
  final RxInt selectedLevel = 0.obs;
  final RxInt selectedTopping = 0.obs;
  final RxInt itemQuantity = 1.obs;
  final Rx<TextEditingController> noteController = TextEditingController().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getDetailMenu();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    // Dispose of any resources or subscriptions here
    super.onClose();
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
    } finally {
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

  // create open level bottom sheet with parameter List<level>
  void openLevelBottomSheet() {
    if (detailMenu.value.data!.level!.isNotEmpty) {
      Get.bottomSheet(
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: SizedBox(
            height: 100.h,
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pilih Level",
                  style: GoogleTextStyle.fw700.copyWith(
                    fontSize: 18,
                    color: MainColor.black,
                  ),
                ),
                const SizedBox(height: 10),
                Obx(() {
                  return Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: List<Widget>.generate(
                      detailMenu.value.data?.level?.length ?? 0,
                      (index) {
                        final level = detailMenu.value.data!.level![index];
                        final isSelected = selectedLevel.value == index;
                        return ChoiceChip(
                          label: Text(
                            level.keterangan!,
                            style: GoogleTextStyle.fw600.copyWith(
                              fontSize: 14,
                              color:
                                  isSelected ? Colors.white : MainColor.primary,
                            ),
                          ),
                          selected: isSelected,
                          onSelected: (selected) {
                            setSelectedLevel(index);
                            Future.delayed(const Duration(milliseconds: 1000));
                            // Get.back();
                          },
                          selectedColor: MainColor.primary,
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: MainColor.primary),
                          avatar: isSelected
                              ? const Icon(Icons.check, color: Colors.white)
                              : null,
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
        // rounded corner
        elevation: 0,
        backgroundColor: Colors.white,
        barrierColor: Colors.black.withOpacity(0.2),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      );
    }
  }

  // create open topping bottom sheet with parameter List<topping>
  void openToppingBottomSheet() {
    if (detailMenu.value.data!.topping!.isNotEmpty) {
      Get.bottomSheet(
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: SizedBox(
            height: 100.h,
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pilih Topping",
                  style: GoogleTextStyle.fw700.copyWith(
                    fontSize: 18,
                    color: MainColor.black,
                  ),
                ),
                const SizedBox(height: 10),
                Obx(() {
                  return Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: List<Widget>.generate(
                      detailMenu.value.data?.topping?.length ?? 0,
                      (index) {
                        final topping = detailMenu.value.data!.topping![index];
                        final isSelected = selectedTopping.value == index;
                        return ChoiceChip(
                          label: Text(
                            topping.keterangan!,
                            style: GoogleTextStyle.fw600.copyWith(
                              fontSize: 14,
                              color:
                                  isSelected ? Colors.white : MainColor.primary,
                            ),
                          ),
                          selected: isSelected,
                          onSelected: (selected) {
                            setSelectedTopping(index);
                            Future.delayed(const Duration(milliseconds: 1000));
                            // Get.back();
                          },
                          selectedColor: MainColor.primary,
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: MainColor.primary),
                          avatar: isSelected
                              ? const Icon(Icons.check, color: Colors.white)
                              : null,
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
        // rounded corner
        elevation: 0,
        backgroundColor: Colors.white,
        barrierColor: Colors.black.withOpacity(0.2),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      );
    }
  }

  void openNoteBottomSheet() {
    Get.bottomSheet(
      Padding(
        padding: MediaQuery.of(Get.context!).viewInsets,
        child: Padding(
          padding: EdgeInsets.only(
            left: 25.0,
            right: 25.0,
            top: 25.0,
            bottom: MediaQuery.of(Get.context!).viewInsets.bottom + 25.0,
          ),
          child: SizedBox(
            height: 150.h,
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Note",
                  style: GoogleTextStyle.fw700.copyWith(
                    fontSize: 18,
                    color: MainColor.black,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: noteController.value,
                  // maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Type your note here, e.g. less sugar, no ice",
                    hintStyle: GoogleTextStyle.fw400.copyWith(
                      fontSize: 14,
                      color: MainColor.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // rounded corner
      elevation: 0,
      backgroundColor: Colors.white,
      barrierColor: Colors.black.withOpacity(0.2),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      isScrollControlled: true,
    );
  }
}
