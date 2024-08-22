import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:trainee/modules/features/navbar/modules/order/models/order_detail_model.dart';
import 'package:trainee/modules/features/navbar/modules/order/models/order_list_model.dart';

import 'package:trainee/modules/features/navbar/modules/order/repositories/order_repository.dart';

class OrderDetailController extends GetxController {
  static OrderDetailController get to => Get.find<OrderDetailController>();
  final RxBool isLoading = true.obs;

  final Rx<OrderDetailDataModel> orderDetailDataItems =
      OrderDetailDataModel().obs;
  final Rx<OrderListDataModel> order = OrderListDataModel().obs;

  @override
  void onInit() {
    order.value = Get.arguments;
    super.onInit();
    getOrderDetail();
  }

  Future<void> getOrderDetail() async {
    try {
      isLoading.value = true;
      OrderDetailAPIModel orderDetail =
          await OrderRepository.getOrderDetail(order.value.idOrder.toString());
      orderDetailDataItems.value = orderDetail.data!;
      isLoading.value = false;
    } catch (exception, stacktrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stacktrace,
      );
      isLoading.value = false;
    }
  }

  void clickCancelOrder(BuildContext context) {
    Get.bottomSheet(
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              title: Text("Apakah anda yakin ingin membatalkan pesanan ini?"),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Tidak"),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      Get.back();
                      String res = await postOrderCancel(context);
                      if (res == "Pesanan berhasil dibatalkan") {
                        Get.back();
                      } else {
                        // ignore: use_build_context_synchronously
                        _showErrorDialog(context, "Gagal", res);
                      }
                    },
                    child: const Text("Ya"),
                  ),
                ),
              ],
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.white);
  }

  Future<String> postOrderCancel(BuildContext context) async {
    try {
      EasyLoading.show(status: "Membatalkan Pesanan");

      final response =
          await OrderRepository.postOrderCancel(order.value.idOrder.toString());

      if (response.statusCode == 200) {
        return "Pesanan berhasil dibatalkan";
      } else {
        return "Gagal Membatalkan Pesanan";
      }
    } catch (e) {
      return "Gagal Membatalkan Pesanan";
    } finally {
      EasyLoading.dismiss();
    }
  }

  void _showErrorDialog(BuildContext context, String title, String message) {
    PanaraInfoDialog.show(
      context,
      title: title,
      message: message,
      buttonText: "Oke",
      onTapDismiss: () {
        Get.back();
      },
      panaraDialogType: PanaraDialogType.warning,
      barrierDismissible: false,
    );
  }

  List<OrderDetailDetailModel> get foodItems =>
      orderDetailDataItems.value.detail!
          .where((element) => element.kategori == "makanan")
          .toList();

  List<OrderDetailDetailModel> get drinkItems =>
      orderDetailDataItems.value.detail!
          .where((element) => element.kategori == "minuman")
          .toList();

  List<OrderDetailDetailModel> get snackItems =>
      orderDetailDataItems.value.detail!
          .where((element) => element.kategori == "snack")
          .toList();
}
