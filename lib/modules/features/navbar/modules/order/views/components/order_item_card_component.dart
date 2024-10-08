import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trainee/configs/themes/main_color.dart';
import 'package:trainee/modules/features/navbar/modules/order/models/order_list_model.dart';
import 'package:trainee/modules/features/navbar/modules/order/views/components/outlined_title_button_component.dart';
import 'package:trainee/modules/features/navbar/modules/order/views/components/primary_button_with_title_component.dart';
import 'package:trainee/shared/styles/google_text_style.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({
    super.key,
    required this.order,
    this.onTap,
    this.onOrderAgain,
    this.onGiveReview,
  });

  final OrderListDataModel order;
  final VoidCallback? onTap;
  final VoidCallback? onOrderAgain;
  final ValueChanged<int>? onGiveReview;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Ink(
        padding: EdgeInsets.all(7.r),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 8,
              spreadRadius: -1,
              color: Colors.black38,
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 3,
                child: Hero(
                  tag: 'order-${order.idOrder}',
                  child: Container(
                    width: 124.w,
                    constraints: BoxConstraints(
                      minHeight: 124.h,
                      maxWidth: 124.w,
                    ),
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.grey[300],
                    ),
                    child: CachedNetworkImage(
                      imageUrl: order.menu!.isNotEmpty
                          ? order.menu!.first.foto ??
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/240px-No_image_available.svg.png'
                          : 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/240px-No_image_available.svg.png',
                      fit: BoxFit.contain,
                      height: 75.h,
                      width: 75.w,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              12.horizontalSpace,
              Flexible(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    5.verticalSpace,

                    // order status
                    Row(
                      children: [
                        if (order.status == 0)
                          Icon(
                            Icons.access_time,
                            color: const Color(0xFFFFAC01),
                            size: 16.r,
                          ),
                        if (order.status == 1)
                          Icon(
                            Icons.access_time,
                            color: const Color(0xFFFFAC01),
                            size: 16.r,
                          ),
                        if (order.status == 2)
                          Icon(
                            Icons.access_time,
                            color: const Color(0xFF009C48),
                            size: 16.r,
                          ),
                        if (order.status == 3)
                          Icon(
                            Icons.check,
                            color: const Color(0xFF009C48),
                            size: 16.r,
                          ),
                        if (order.status == 4)
                          Icon(
                            Icons.close,
                            color: const Color(0xFFD81D1D),
                            size: 16.r,
                          ),
                        5.horizontalSpaceRadius,
                        Expanded(
                          child: ConditionalSwitch.single<int>(
                            context: context,
                            valueBuilder: (context) => order.status!,
                            caseBuilders: {
                              0: (context) => Text(
                                    'Dalam antrian'.tr,
                                    style: GoogleTextStyle.fw500.copyWith(
                                        fontSize: 12.sp,
                                        color: const Color(0xFFFFAC01)),
                                  ),
                              1: (context) => Text(
                                    'Sedang disiapkan'.tr,
                                    style: GoogleTextStyle.fw500.copyWith(
                                        fontSize: 12.sp,
                                        color: const Color(0xFFFFAC01)),
                                  ),
                              2: (context) => Text(
                                    'Bisa diambil'.tr,
                                    style: GoogleTextStyle.fw500.copyWith(
                                        fontSize: 12.sp,
                                        color: const Color(0xFFFFAC01)),
                                  ),
                              3: (context) => Text(
                                    'Sudah diambil'.tr,
                                    style: GoogleTextStyle.fw500.copyWith(
                                        fontSize: 12.sp,
                                        color: const Color(0xFF009C48)),
                                  ),
                              4: (context) => Text(
                                    'Dibatalkan'.tr,
                                    style: GoogleTextStyle.fw500.copyWith(
                                        fontSize: 12.sp,
                                        color: const Color(0xFFE62129)),
                                  ),
                            },
                            fallbackBuilder: (context) => const SizedBox(),
                          ),
                        ),
                        Text(
                          DateFormat(
                            'dd MMMM yyyy',
                            Get.locale?.countryCode,
                          ).format(DateTime.parse(order.tanggal!)),
                          style: GoogleTextStyle.fw500
                              .copyWith(fontSize: 12.sp, color: MainColor.grey),
                        ),
                      ],
                    ),
                    14.verticalSpace,

                    // Menu title
                    Text(
                      order.menu!.map((e) => e.nama).join(', '),
                      style: GoogleTextStyle.fw500
                          .copyWith(fontSize: 18.sp, color: MainColor.black),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    5.verticalSpace,

                    // Price
                    Row(
                      children: [
                        Text(
                          'Rp ${order.totalBayar}',
                          style: GoogleTextStyle.fw500.copyWith(
                              fontSize: 14.sp, color: MainColor.primary),
                        ),
                        5.horizontalSpace,
                        Text(
                          '(${order.menu!.length} Menu)',
                          style: GoogleTextStyle.fw500
                              .copyWith(fontSize: 12.sp, color: MainColor.grey),
                        ),
                      ],
                    ),

                    // Action Button
                    Conditional.single(
                      context: context,
                      conditionBuilder: (context) =>
                          order.status == 3 || order.status == 4,
                      widgetBuilder: (context) => Wrap(
                        spacing: 15.r,
                        children: [
                          if (order.status == 3)
                            Padding(
                              padding: EdgeInsets.only(top: 10.r, bottom: 5.r),
                              child: OutlinedTitleButtonComponent.compact(
                                text: 'Beri Penilaian'.tr,
                                onPressed: () =>
                                    onGiveReview?.call(order.idOrder!),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.r,
                                bottom: 5.r,
                                right: order.status == 3 ? 0.r : 0.3.sw),
                            child: PrimaryButtonWithTitleComponent.compact(
                              backgroundColor: MainColor.primary,
                              title: 'Pesan Lagi'.tr,
                              onPressed: onOrderAgain,
                            ),
                          ),
                        ],
                      ),
                      fallbackBuilder: (context) => const SizedBox(),
                    ),
                  ],
                ),
              ),
              5.horizontalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
