import 'package:dio/dio.dart';
import 'package:trainee/constants/cores/api/api_constant.dart';
import 'package:trainee/modules/features/navbar/modules/order/models/order_cancel_model.dart';
import 'package:trainee/modules/features/navbar/modules/order/models/order_detail_model.dart';
import 'package:trainee/modules/features/navbar/modules/order/models/order_history_model.dart';
import 'package:trainee/modules/features/navbar/modules/order/models/order_list_model.dart';
import 'package:trainee/modules/global_repositories/api_exception_repository.dart';
import 'package:trainee/utils/services/dio_service.dart';
import 'package:trainee/utils/services/local_storage_service.dart';

class OrderRepository {
  OrderRepository._();

  // init dio frm DioService
  static final Dio _dio = DioService.dioCall();

  // get user data from LocalStorageService
  static final _userData = LocalStorageService.getUserData();

  static Future<OrderListAPIModel> getOrderList() async {
    try {
      String endpointStr = ApiConstant.getOrderListofOneUser +
          _userData["data"]["user"]["id_user"].toString();
      final response = await _dio.get(
        endpointStr,
        options: Options(
          headers: {
            "token": _userData["data"]["token"],
          },
        ),
      );
      if (response.statusCode == 200) {
        return OrderListAPIModel.fromJson(response.data);
      } else {
        final errorData = response.data;
        final errorMessage =
            errorData['errors'] != null && errorData['errors'].isNotEmpty
                ? errorData['errors'][0]
                : 'Unknown error';
        throw ApiException(errorMessage, statusCode: response.statusCode);
      }
    } catch (e) {
      if (e is DioException) {
        final errorData = e.response?.data;
        final errorMessage =
            errorData['errors'] != null && errorData['errors'].isNotEmpty
                ? errorData['errors'][0]
                : 'Network error: ${e.message}';
        throw ApiException(errorMessage, statusCode: e.response?.statusCode);
      } else {
        throw ApiException(e.toString());
      }
    }
  }

  static Future<OrderDetailAPIModel> getOrderDetail(String orderId) async {
    try {
      String endpointStr = ApiConstant.getOrderDetail + orderId;
      final response = await _dio.get(
        endpointStr,
        options: Options(
          headers: {
            "token": _userData["data"]["token"],
          },
        ),
      );
      if (response.statusCode == 200) {
        return OrderDetailAPIModel.fromJson(response.data);
      } else {
        final errorData = response.data;
        final errorMessage =
            errorData['errors'] != null && errorData['errors'].isNotEmpty
                ? errorData['errors'][0]
                : 'Unknown error';
        throw ApiException(errorMessage, statusCode: response.statusCode);
      }
    } catch (e) {
      if (e is DioException) {
        final errorData = e.response?.data;
        final errorMessage =
            errorData['errors'] != null && errorData['errors'].isNotEmpty
                ? errorData['errors'][0]
                : 'Network error: ${e.message}';
        throw ApiException(errorMessage, statusCode: e.response?.statusCode);
      } else {
        throw ApiException(e.toString());
      }
    }
  }

  static Future<OrderCancelAPIModel> postOrderCancel(String orderId) async {
    try {
      String endpointStr = ApiConstant.postOrderCancel + orderId;
      final response = await _dio.post(
        endpointStr,
        options: Options(
          headers: {
            "token": _userData["data"]["token"],
          },
        ),
      );
      if (response.statusCode == 200 && response.data["status_code"] == 200) {
        return OrderCancelAPIModel.fromJson(response.data);
        // } else if (response.data["status_code"] == 304) {
        //   final errorData = response.data;
        //   final errorMessage = "order already change status like already prepare by kitchen or already cancel";
        //   return
      } else {
        final errorData = response.data;
        final errorMessage =
            errorData['errors'] != null && errorData['errors'].isNotEmpty
                ? errorData['errors'][0]
                : 'Unknown error';
        throw ApiException(errorMessage, statusCode: response.statusCode);
      }
    } catch (e) {
      if (e is DioException) {
        final errorData = e.response?.data;
        final errorMessage =
            errorData['errors'] != null && errorData['errors'].isNotEmpty
                ? errorData['errors'][0]
                : 'Network error: ${e.message}';
        throw ApiException(errorMessage, statusCode: e.response?.statusCode);
      } else {
        throw ApiException(e.toString());
      }
    }
  }

  static Future<OrderHistoryAPIModel> getOrderHistory() async {
    try {
      String endpointStr = ApiConstant.getOrderHistoryofOneUser +
          _userData["data"]["user"]["id_user"].toString();
      final response = await _dio.post(
        endpointStr,
        options: Options(
          headers: {
            "token": _userData["data"]["token"],
          },
        ),
      );
      if (response.statusCode == 200) {
        return OrderHistoryAPIModel.fromJson(response.data);
      } else {
        final errorData = response.data;
        final errorMessage =
            errorData['errors'] != null && errorData['errors'].isNotEmpty
                ? errorData['errors'][0]
                : 'Unknown error';
        throw ApiException(errorMessage, statusCode: response.statusCode);
      }
    } catch (e) {
      if (e is DioException) {
        final errorData = e.response?.data;
        final errorMessage =
            errorData['errors'] != null && errorData['errors'].isNotEmpty
                ? errorData['errors'][0]
                : 'Network error: ${e.message}';
        throw ApiException(errorMessage, statusCode: e.response?.statusCode);
      } else {
        throw ApiException(e.toString());
      }
    }
  }
}
