import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainee/configs/themes/main_color.dart';
import 'package:trainee/modules/features/navbar/modules/home/modules/detail_menu/controllers/detail_menu_controller.dart';
import 'package:trainee/modules/features/navbar/modules/home/modules/detail_menu/views/components/quantity_item_button_component.dart';
import 'package:trainee/shared/customs/custom_app_bar.dart';
import 'package:trainee/shared/customs/custom_primary_button.dart';
import 'package:trainee/shared/styles/google_text_style.dart';

class DetailMenuView extends StatelessWidget {
  DetailMenuView({super.key});

  // call controller
  final DetailMenuController controller = DetailMenuController.to;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(
          title: "Detail Menu",
          icon: Icon(
            Icons.menu_book_rounded,
          ),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : BuildBody(controller: controller),
        ),
      ),
    );
  }
}

class BuildBody extends StatelessWidget {
  const BuildBody({
    super.key,
    required this.controller,
  });

  final DetailMenuController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
          child: Center(
            child: CachedNetworkImage(
              imageUrl: controller.arg.foto!,
              height: 181,
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TEXT SECTION
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.arg.nama!,
                          style: GoogleTextStyle.fw700.copyWith(
                            fontSize: 20,
                            color: MainColor.primary,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          controller.detailMenu.value.data!.menu!.deskripsi!,
                          style: GoogleTextStyle.fw500.copyWith(
                            fontSize: 16,
                            color: MainColor.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ItemQuantityButtonComponent(controller: controller)
                ],
              ),
              // PRICE, LEVEL, Toping SECTION
              const SizedBox(height: 25),
              const Divider(
                color: MainColor.grey,
                thickness: 1,
              ),
              // create button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.money,
                        color: MainColor.primary,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Price",
                        style: GoogleTextStyle.fw600.copyWith(
                          fontSize: 16,
                          color: MainColor.black,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Rp ${controller.detailMenu.value.data!.menu!.harga!}",
                    style: GoogleTextStyle.fw700.copyWith(
                      fontSize: 18,
                      color: MainColor.primary,
                    ),
                  ),
                ],
              ),
              const Divider(
                color: MainColor.grey,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.stacked_line_chart_rounded,
                        color: MainColor.primary,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Level",
                        style: GoogleTextStyle.fw600.copyWith(
                          fontSize: 16,
                          color: MainColor.black,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.openLevelBottomSheet();
                    },
                    child: Row(
                      children: [
                        Obx(
                          () => Text(
                            controller.detailMenu.value.data!.level!.isEmpty
                                ? "-"
                                : "${controller.detailMenu.value.data!.level![controller.selectedLevel.value].keterangan}",
                            style: GoogleTextStyle.fw600.copyWith(
                              fontSize: 16,
                              color: MainColor.black,
                            ),
                          ),
                        ),
                        if (controller.detailMenu.value.data!.level!.isNotEmpty)
                          const SizedBox(width: 5),
                        if (controller.detailMenu.value.data!.level!.isNotEmpty)
                          const Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: MainColor.black,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                color: MainColor.grey,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.fastfood,
                        color: MainColor.primary,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Topping",
                        style: GoogleTextStyle.fw600.copyWith(
                          fontSize: 16,
                          color: MainColor.black,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.openToppingBottomSheet();
                    },
                    child: Row(
                      children: [
                        Obx(
                          () => Text(
                            controller.detailMenu.value.data!.topping!.isEmpty
                                ? "-"
                                : "${controller.detailMenu.value.data!.topping![controller.selectedTopping.value].keterangan}",
                            style: GoogleTextStyle.fw600.copyWith(
                              fontSize: 16,
                              color: MainColor.black,
                            ),
                          ),
                        ),
                        if (controller
                            .detailMenu.value.data!.topping!.isNotEmpty)
                          const SizedBox(width: 5),
                        if (controller
                            .detailMenu.value.data!.topping!.isNotEmpty)
                          const Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: MainColor.black,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                color: MainColor.grey,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.notes,
                        color: MainColor.primary,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Note",
                        style: GoogleTextStyle.fw600.copyWith(
                          fontSize: 16,
                          color: MainColor.black,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.openNoteBottomSheet();
                    },
                    child: Row(
                      children: [
                        Obx(
                          () => Text(
                            controller.noteController.value.text.isEmpty
                                ? "...add note"
                                : controller.noteController.value.text,
                            style: GoogleTextStyle.fw600.copyWith(
                              fontSize: 16,
                              color: MainColor.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: MainColor.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                color: MainColor.grey,
                thickness: 1,
              ),
              const SizedBox(height: 40),
              CustomPrimaryButton(text: "Add to order", onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
