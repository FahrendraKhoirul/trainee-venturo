import 'package:get/get.dart';
import 'package:trainee/configs/routes/main_route.dart';
import 'package:trainee/modules/features/initial/views/ui/get_location_view.dart';
// import 'package:trainee/utils/services/local_storage_service.dart';
import 'package:trainee/utils/services/location_service.dart';
import 'package:geolocator/geolocator.dart';

class InitialController extends GetxController {
  static InitialController get to => Get.find();

  /// Location
  RxString statusLocation = RxString('loading');
  RxString messageLocation = RxString('');
  Rxn<Position> position = Rxn<Position>();
  RxnString address = RxnString();

  // user
  RxString id = RxString('');
  RxString name = RxString('');
  RxString photo = RxString('');

  @override
  void onReady() {
    super.onReady();

    getLocation();
    LocationServices.streamService.listen((status) => getLocation());

    // id.value = LocalStorageService.box.get("id");
    // name.value = LocalStorageService.box.get("name");
    // photo.value = LocalStorageService.box.get("photo");
  }

  Future<void> getLocation() async {
    if (Get.isDialogOpen == false) {
      Get.dialog(const GetLocationView(), barrierDismissible: false);
    }

    try {
      /// Mendapatkan Lokasi saat ini
      statusLocation.value = 'loading';
      final locationResult = await LocationServices.getCurrentPosition();
      if (locationResult.success) {
        /// Jika jarak lokasi cukup dekat, dapatkan informasi alamat
        position.value = locationResult.position;
        address.value = locationResult.address;
        statusLocation.value = 'success';
        await Future.delayed(const Duration(seconds: 3));
        Get.offAllNamed(MainRoute.navbar);
      } else {
        /// Jika jarak lokasi tidak cukup dekat, tampilkan pesan
        statusLocation.value = 'error';
        messageLocation.value = locationResult.message!;
      }
    } catch (e) {
      /// Jika terjadi kesalahan server
      statusLocation.value = 'error';
      messageLocation.value = 'Server error'.tr;
    }
  }
}
