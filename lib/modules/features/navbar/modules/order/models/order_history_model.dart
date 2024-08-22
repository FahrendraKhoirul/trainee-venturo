import 'package:trainee/modules/features/navbar/modules/order/models/order_list_model.dart';

class OrderHistoryAPIModel {
  int? statusCode;
  OrderHistoryDataModel? data;

  OrderHistoryAPIModel({this.statusCode, this.data});

  OrderHistoryAPIModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    data = json['data'] != null
        ? OrderHistoryDataModel.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class OrderHistoryDataModel {
  List<OrderListDataModel>? listData;
  int? totalPrice;
  int? totalOrder;

  OrderHistoryDataModel({this.listData, this.totalPrice, this.totalOrder});

  OrderHistoryDataModel.fromJson(Map<String, dynamic> json) {
    if (json['listData'] != null) {
      listData = <OrderListDataModel>[];
      json['listData'].forEach((v) {
        listData!.add(OrderListDataModel.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
    totalOrder = json['totalOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listData != null) {
      data['listData'] = listData!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = totalPrice;
    data['totalOrder'] = totalOrder;
    return data;
  }
}
