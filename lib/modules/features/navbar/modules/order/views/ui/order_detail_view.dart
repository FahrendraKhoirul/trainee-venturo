import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trainee/configs/themes/main_color.dart';
import 'package:trainee/modules/features/navbar/modules/home/views/components/section_header.dart';
import 'package:trainee/modules/features/navbar/modules/order/controllers/order_detail_controller.dart';
import 'package:trainee/modules/features/navbar/modules/order/views/components/order_sliver_list_component.dart';
import 'package:trainee/modules/features/navbar/modules/order/views/components/order_tracker_component.dart';
import 'package:trainee/shared/customs/custom_app_bar.dart';
import 'package:trainee/shared/customs/tile_option.dart';
import 'package:trainee/shared/styles/google_text_style.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  const OrderDetailView({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  @override
  Widget build(BuildContext context) {
    analytics.setCurrentScreen(
      screenName: 'Detail Order Screen',
      screenClassOverride: 'Trainee',
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Order',
        icon: const Icon(Icons.shopping_bag_outlined),
        actions: [
          Obx(
            () => Conditional.single(
              context: context,
              conditionBuilder: (context) => controller.order.value.status == 0,
              widgetBuilder: (context) => Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
                child: TextButton(
                  onPressed: () {
                    controller.clickCancelOrder(context);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                  ),
                  child: Text(
                    'Cancel'.tr,
                    style: Get.textTheme.labelLarge
                        ?.copyWith(color: const Color(0xFFD81D1D)),
                  ),
                ),
              ),
              fallbackBuilder: (context) => const SizedBox(),
            ),
          ),
        ],
      ),
      body: Obx(
        () => Conditional.single(
          context: context,
          conditionBuilder: (context) => controller.isLoading.value == false,
          widgetBuilder: (context) => CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: 28.verticalSpace),
              if (controller.foodItems.isNotEmpty) ...[
                SliverToBoxAdapter(
                  child: SectionHeader(
                    icon: Icons.food_bank_outlined,
                    title: 'Food',
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                  sliver: OrderListSliverComponent(
                    orders: controller.foodItems,
                  ),
                )
              ],
              SliverToBoxAdapter(child: 17.verticalSpace),
              if (controller.drinkItems.isNotEmpty) ...[
                SliverToBoxAdapter(
                  child: SectionHeader(
                    icon: Icons.food_bank_outlined,
                    title: 'Drink',
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                  sliver: OrderListSliverComponent(
                    orders: controller.drinkItems,
                  ),
                )
              ],
              SliverToBoxAdapter(child: 17.verticalSpace),
              if (controller.snackItems.isNotEmpty) ...[
                SliverToBoxAdapter(
                  child: SectionHeader(
                    icon: Icons.food_bank_outlined,
                    title: 'Snack',
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                  sliver: OrderListSliverComponent(
                    orders: controller.snackItems,
                  ),
                )
              ],
            ],
          ),
          fallbackBuilder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Conditional.single(
          context: context,
          conditionBuilder: (context) => controller.isLoading == false,
          // DetailOrderController.to.orderDetailState.value == 'success',
          widgetBuilder: (context) => Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.r),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 25.h, horizontal: 22.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Total order tile
                      TileOption(
                        title: 'Total Pesanan',
                        subtitle:
                            '(${controller.orderDetailDataItems.value.detail!.length} Menu):',
                        message:
                            'Rp ${controller.orderDetailDataItems.value.order!.totalBayar ?? '0'}',
                        titleStyle: GoogleTextStyle.fw700
                            .copyWith(fontSize: 18, color: MainColor.black),
                        messageStyle: GoogleTextStyle.fw700
                            .copyWith(fontSize: 14, color: MainColor.primary),
                        subtitleStyle: GoogleTextStyle.fw600
                            .copyWith(fontSize: 18, color: MainColor.black),
                      ),

                      // Discount tile
                      Conditional.single(
                        context: context,
                        conditionBuilder: (context) =>
                            controller
                                    .orderDetailDataItems.value.order!.diskon ==
                                1 &&
                            // DetailOrderController.to.order.value?['diskon'] ==
                            // 1 &&
                            controller.orderDetailDataItems.value.order!
                                    .potongan ==
                                0,
                        // DetailOrderController.to.order.value?['potongan'] >
                        //     0,
                        widgetBuilder: (context) => TileOption(
                          icon: Icons.discount_outlined,
                          iconSize: 24.r,
                          title: 'Discount',
                          message:
                              'Rp ${controller.orderDetailDataItems.value.order!.potongan ?? '0'}',
                          titleStyle: GoogleTextStyle.fw600
                              .copyWith(fontSize: 18, color: MainColor.black),
                          messageStyle: Get.textTheme.titleMedium?.copyWith(
                              color: const Color(0xFFD81D1D),
                              fontWeight: FontWeight.w600),
                        ),
                        fallbackBuilder: (context) => const SizedBox(),
                      ),
                      Divider(color: Colors.black54, height: 2.h),

                      // Vouchers tile
                      Conditional.single(
                        context: context,
                        conditionBuilder: (context) =>
                            controller
                                .orderDetailDataItems.value.order!.idVoucher !=
                            0,
                        widgetBuilder: (context) => TileOption(
                          icon: Icons.discount,
                          iconSize: 24.r,
                          title: 'Voucher'.tr,
                          message:
                              "Rp ${controller.orderDetailDataItems.value.order!.potongan ?? '0'}",
                          // 'Rp ${DetailOrOrdederController.to.order.value?['potongan'] ?? '0'}',
                          messageSubtitle: OrderDetailController
                              .to.orderDetailDataItems.value.order!.namaVoucher,
                          titleStyle: GoogleTextStyle.fw600
                              .copyWith(fontSize: 18, color: MainColor.black),
                          messageStyle: Get.textTheme.titleMedium?.copyWith(
                              color: const Color(0xFFD81D1D),
                              fontWeight: FontWeight.w600),
                        ),
                        fallbackBuilder: (context) => const SizedBox(),
                      ),
                      // Divider(color: const Color(0xFFD81D1D), height: 2.h),

                      // Payment options tile
                      TileOption(
                        icon: Icons.payment_outlined,
                        iconSize: 24.r,
                        title: 'Pembayaran'.tr,
                        message: 'Pay Later',
                        titleStyle: GoogleTextStyle.fw600
                            .copyWith(fontSize: 18, color: MainColor.black),
                        messageStyle: GoogleTextStyle.fw400
                            .copyWith(fontSize: 14, color: MainColor.black),
                      ),

                      Divider(
                        color: Colors.black26,
                        height: 2.h,
                        thickness: 0.5.sp,
                      ),

                      // total payment
                      TileOption(
                        iconSize: 24.r,
                        title: 'Total Pembayaran'.tr,
                        message:
                            "Rp ${controller.orderDetailDataItems.value.order!.totalBayar ?? '0'}",
                        titleStyle: GoogleTextStyle.fw600
                            .copyWith(fontSize: 18, color: MainColor.black),
                        messageStyle: GoogleTextStyle.fw700
                            .copyWith(fontSize: 18, color: MainColor.primary),
                      ),
                      Divider(
                        color: Colors.black26,
                        height: 2.h,
                        thickness: 0.5.sp,
                      ),
                      24.verticalSpace,

                      // order status track
                      const OrderTrackerComponent(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          fallbackBuilder: (context) => const SizedBox(),
        ),
      ),
    );
  }
}
