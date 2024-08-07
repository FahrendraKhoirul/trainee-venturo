import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainee/configs/themes/main_color.dart';
import 'package:trainee/modules/features/navbar/modules/home/modules/detail_menu/controllers/detail_menu_controller.dart';
import 'package:trainee/shared/styles/google_text_style.dart';

class ItemQuantityButtonComponent extends StatelessWidget {
  const ItemQuantityButtonComponent({
    super.key,
    required this.controller,
  });

  final DetailMenuController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            controller.decrementQuantity();
          },
          icon: Container(
            // outline border
            decoration: BoxDecoration(
              border: Border.all(
                color: MainColor.primary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(
              Icons.remove,
              color: MainColor.primary,
            ),
          ),
        ),
        Obx(
          () => Text(
            controller.itemQuantity.toString(),
            style: GoogleTextStyle.fw500.copyWith(
              fontSize: 18,
              color: MainColor.black,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            controller.incrementQuantity();
          },
          icon: Container(
            // outline border
            decoration: BoxDecoration(
              color: MainColor.primary,
              border: Border.all(
                color: MainColor.primary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(
              Icons.add,
              color: MainColor.white,
            ),
          ),
        ),
      ],
    );
  }
}
