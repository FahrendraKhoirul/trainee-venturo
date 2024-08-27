import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trainee/configs/routes/main_route.dart';
import 'package:trainee/modules/features/navbar/modules/order/controllers/order_controller.dart';
import 'package:trainee/modules/features/navbar/modules/order/views/components/order_item_card_component.dart';

class OnGoingOrderTabView extends StatelessWidget {
  const OnGoingOrderTabView({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    analytics.setCurrentScreen(
      screenName: 'Ongoing Order Screen',
      screenClassOverride: 'Trainee',
    );

    return RefreshIndicator(
      onRefresh: () async {
        print("Refresh OrderList");
        await OrderController.to.getOrderList();
        print("Done Refresh OrderList");
      },
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.all(25.r),
          itemBuilder: (context, index) {
            return OrderItemCard(
              order: OrderController.to.orderListDataItems[index],
              onTap: () {
                Get.toNamed(
                    "${MainRoute.order}/${OrderController.to.orderListDataItems[index].idOrder}",
                    arguments: OrderController.to.orderListDataItems[index]);
              },
              onOrderAgain: () {},
            );
          },
          separatorBuilder: (context, index) => 16.verticalSpace,
          itemCount: OrderController.to.orderListDataItems.length,
        ),
      ),
    );
  }
}
