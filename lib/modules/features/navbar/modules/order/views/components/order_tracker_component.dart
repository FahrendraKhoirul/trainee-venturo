import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trainee/configs/themes/main_color.dart';
import 'package:trainee/modules/features/navbar/modules/order/controllers/order_detail_controller.dart';
import 'package:trainee/modules/features/navbar/modules/order/views/components/checked_step_component.dart';
import 'package:trainee/modules/features/navbar/modules/order/views/components/unchecked_step_component.dart';
import 'package:trainee/shared/styles/google_text_style.dart';

class OrderTrackerComponent extends StatelessWidget {
  const OrderTrackerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pesanan kamu sedang disiapkan'.tr,
          style: GoogleTextStyle.fw700
              .copyWith(fontSize: 16, color: MainColor.black),
          textAlign: TextAlign.left,
        ),
        18.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(flex: 10),
            Expanded(
              flex: 10,
              child: Conditional.single(
                context: context,
                conditionBuilder: (context) =>
                    OrderDetailController
                            .to.orderDetailDataItems.value.order!.status ==
                        0 ||
                    OrderDetailController
                            .to.orderDetailDataItems.value.order!.status ==
                        1,
                widgetBuilder: (context) => const CheckedStepComponent(),
                fallbackBuilder: (context) => const UncheckedStepComponent(),
              ),
            ),
            const Spacer(flex: 3),
            Expanded(
              flex: 42,
              child: Container(
                height: 4.r,
                color: Colors.black26,
              ),
            ),
            const Spacer(flex: 3),
            Expanded(
              flex: 10,
              child: Conditional.single(
                context: context,
                conditionBuilder: (context) =>
                    OrderDetailController
                        .to.orderDetailDataItems.value.order!.status ==
                    2,
                widgetBuilder: (context) => const CheckedStepComponent(),
                fallbackBuilder: (context) => const UncheckedStepComponent(),
              ),
            ),
            const Spacer(flex: 3),
            Expanded(
              flex: 42,
              child: Container(
                height: 4.r,
                color: Colors.black26,
              ),
            ),
            const Spacer(flex: 3),
            Expanded(
              flex: 10,
              child: Conditional.single(
                context: context,
                conditionBuilder: (context) =>
                    OrderDetailController
                        .to.orderDetailDataItems.value.order!.status ==
                    3,
                widgetBuilder: (context) => const CheckedStepComponent(),
                fallbackBuilder: (context) => const UncheckedStepComponent(),
              ),
            ),
            const Spacer(flex: 10),
          ],
        ),
        11.verticalSpacingRadius,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Pesanan Diterima'.tr,
                style: GoogleTextStyle.fw400
                    .copyWith(fontSize: 12, color: MainColor.black),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Expanded(
              child: Text(
                'Silahkan Diambil'.tr,
                style: GoogleTextStyle.fw400
                    .copyWith(fontSize: 12, color: MainColor.black),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Expanded(
              child: Text(
                'Pesanan Selesai'.tr,
                style: GoogleTextStyle.fw400
                    .copyWith(fontSize: 12, color: MainColor.black),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
