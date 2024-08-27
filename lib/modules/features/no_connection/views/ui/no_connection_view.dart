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
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 20.h),
          const Text(
            "Oops! There is no internet connection",
          ),
          SizedBox(height: 10.h),
          const Text(
            "Please check your internet connection and try again",
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
                      "Something went wrong",
                      "Connection still not available",
                    );
                  }
                },
                child: const Text(
                  "Try Again",
                  textAlign: TextAlign.center,
                )),
          ),
        ],
      ),
    ));
  }
}
