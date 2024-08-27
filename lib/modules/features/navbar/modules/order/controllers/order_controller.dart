import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:trainee/modules/features/navbar/modules/order/models/order_history_model.dart';
import 'package:trainee/modules/features/navbar/modules/order/models/order_list_model.dart';
import 'package:trainee/modules/features/navbar/modules/order/repositories/order_repository.dart';

class OrderController extends GetxController {
  static OrderController get to => Get.find<OrderController>();

  final RxList<OrderListDataModel> orderListDataItems =
      <OrderListDataModel>[].obs;
  final Rx<OrderHistoryDataModel> orderHistoryDataItem =
      OrderHistoryDataModel().obs;
  final RxBool isLoadingOrderList = true.obs;
  final RxBool isLoadingHistoryList = true.obs;

  @override
  void onInit() async {
    super.onInit();
    await getOrderList();
    await getOrderHistory();
  }

  Future<void> getOrderList() async {
    try {
      isLoadingOrderList.value = true;
      OrderListAPIModel orderList = await OrderRepository.getOrderList();
      // print("TES CALL API" + orderList.data.toString());
      orderListDataItems.value = orderList.data!
          .where((element) =>
              element.status == 0 || element.status == 1 || element.status == 2)
          .toList();
      isLoadingOrderList.value = false;
    } catch (exception, stacktrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stacktrace,
      );
      isLoadingOrderList.value = false;
    }
  }

  Future<void> getOrderHistory() async {
    try {
      isLoadingHistoryList.value = true;
      OrderHistoryAPIModel orderHistory =
          await OrderRepository.getOrderHistory();
      print("TES CALL API" + orderHistory.data.toString());
      orderHistoryDataItem.value = orderHistory.data!;
      isLoadingHistoryList.value = false;
    } catch (exception, stacktrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stacktrace,
      );
      isLoadingHistoryList.value = false;
    }
  }
}
