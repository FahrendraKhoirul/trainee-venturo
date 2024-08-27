import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trainee/configs/themes/main_color.dart';
import 'package:trainee/modules/features/navbar/modules/order/controllers/order_controller.dart';
import 'package:trainee/modules/features/navbar/modules/order/views/components/order_item_card_component.dart';
import 'package:trainee/shared/styles/google_text_style.dart';

class HistoryOrderTabView extends GetView<OrderController> {
  const HistoryOrderTabView({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    analytics.setCurrentScreen(
      screenName: 'History Order Screen',
      screenClassOverride: 'Trainee',
    );

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await OrderController.to.getOrderHistory();
        },
        child: Obx(
          () => ListView.separated(
            padding: EdgeInsets.all(25.r),
            itemBuilder: (context, index) {
              return OrderItemCard(
                order: controller.orderHistoryDataItem.value.listData![index],
                onTap: () {
                  // Get.toNamed(
                  //     "${MainRoute.order}/${OrderController.to.orderListDataItems[index].idOrder}",
                  //     arguments: OrderController.to.orderListDataItems[index]);
                },
                onOrderAgain: () {},
              );
            },
            separatorBuilder: (context, index) => 16.verticalSpace,
            itemCount: controller.orderHistoryDataItem.value.listData!.length,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: 1.sw,
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30.r),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Pesanan'.tr,
              style: GoogleTextStyle.fw700.copyWith(
                color: MainColor.black,
                fontSize: 18.sp,
              ),
            ),
            5.horizontalSpace,
            Obx(() => Text(
                  'Rp ${controller.orderHistoryDataItem.value.totalPrice ?? 0}',
                  style: GoogleTextStyle.fw700.copyWith(
                    color: MainColor.primary,
                    fontSize: 18.sp,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
