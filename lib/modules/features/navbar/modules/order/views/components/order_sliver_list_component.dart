import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee/modules/features/navbar/modules/order/models/order_detail_model.dart';
import 'package:trainee/modules/features/navbar/modules/order/views/components/detail_order_card_component.dart';

class OrderListSliverComponent extends StatelessWidget {
  const OrderListSliverComponent({
    super.key,
    required this.orders,
  });

  final List<OrderDetailDetailModel> orders;

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.5.h),
            child: DetailOrderCardComponent(
              orders[index],
            ),
          );
        },
        childCount: orders.length,
      ),
      itemExtent: 112.h,
    );
  }
}
