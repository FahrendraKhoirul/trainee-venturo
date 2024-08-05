import 'package:dio/dio.dart';
import 'package:trainee/constants/cores/api/api_constant.dart';
import 'package:trainee/modules/features/navbar/modules/home/models/promo_model.dart';
import 'package:trainee/modules/global_repositories/api_exception_repository.dart';
import 'package:trainee/utils/services/dio_service.dart';
import 'package:trainee/utils/services/local_storage_service.dart';

class PromoRepository {
  PromoRepository._();

  // init dio frm DioService
  static final Dio _dio = DioService.dioCall();

  // get user data from LocalStorageService
  static final _userData = LocalStorageService.getUserData();

  static Future<PromosModel> getAllPromo() async {
    try {
      final response = await _dio.get(
        ApiConstant.getAllPromo,
        options: Options(
          headers: {
            "token": _userData["data"]["token"],
          },
        ),
      );
      if (response.statusCode == 200) {
        // print("Promos data: ${response.data["data"][0]}");
        // print(PromosModel.fromJson(response.data).toString());
        return PromosModel.fromJson(response.data);
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
