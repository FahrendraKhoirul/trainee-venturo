import 'package:flutter/material.dart';
import 'package:trainee/modules/features/navbar/modules/order/views/components/order_top_bar_component.dart';
import 'package:trainee/modules/features/navbar/modules/order/views/ui/history_order_view.dart';
import 'package:trainee/modules/features/navbar/modules/order/views/ui/on_going_order_tab_view.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: OrderTopBarComponent(),
          body: TabBarView(
            children: [OnGoingOrderTabView(), HistoryOrderTabView()],
          ),
        ),
      ),
    );
  }
}
