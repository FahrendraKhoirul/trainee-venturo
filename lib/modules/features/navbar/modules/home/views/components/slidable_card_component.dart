import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:trainee/modules/features/navbar/modules/home/controllers/home_controller.dart';
import 'package:trainee/modules/features/navbar/modules/home/models/menu_model.dart';
import 'package:trainee/modules/features/navbar/modules/home/views/components/menu_card.dart';

class SlidableCardComponent extends StatelessWidget {
  const SlidableCardComponent({
    super.key,
    required this.item,
  });

  final DataMenu item;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(vertical: 8.5.h),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  HomeController.to.deleteMenuItem(item);
                },
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(10.r),
                ),
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Material(
            borderRadius: BorderRadius.circular(10.r),
            elevation: 2,
            child: MenuCard(
              menu: item,
              isSelected: HomeController.to.selectedItems.contains(item),
              onTap: () {
                if (HomeController.to.selectedItems.contains(item)) {
                  HomeController.to.selectedItems.remove(item);
                } else {
                  HomeController.to.selectedItems.add(item);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
