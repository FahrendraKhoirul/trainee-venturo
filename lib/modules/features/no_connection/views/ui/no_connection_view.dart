import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:trainee/configs/routes/main_route.dart';
import 'package:trainee/configs/themes/main_color.dart';
import 'package:trainee/modules/global_controllers/global_controller.dart';

class NoConnectionView extends StatelessWidget {
  const NoConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: 35.h,
        horizontal: 35.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          // const Image(
          //   image: AssetImage('assets/images/no_connection.png'),
          //   height: 100,
          // ),
          SizedBox(height: 20.h),
          const Text(
            "Oops tidak ada koneksi internet",
            // style: GoogleFonts.roboto(
            //   fontSize: 22.sp,
            //   fontWeight: FontWeight.w700,
            //   color: MainColor.primary,
            // ),
          ),
          SizedBox(height: 10.h),
          const Text(
            "Pastikan wifi atau data seluler terhubung, lalu tekan tombol coba lagi",
            // style: GoogleFonts.roboto(
            //   fontSize: 18.sp,
            //   fontWeight: FontWeight.w400,
            // ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: 150,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MainColor.primary,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  GlobalController.to.checkConnection();
                  if (GlobalController.to.isConnect.value) {
                    Get.offNamed(MainRoute.initial);
                  } else {
                    Get.snackbar(
                      "Terjadi Kesalahan",
                      "Koneksi masih belum tersambung",
                    );
                  }
                },
                child: const Text(
                  "Coba Lagi",
                  // style: GoogleFonts.roboto(
                  //   fontSize: 18.sp,
                  //   fontWeight: FontWeight.w700,
                  // ),
                  textAlign: TextAlign.center,
                )),
          ),
        ],
      ),
    ));
  }
}
