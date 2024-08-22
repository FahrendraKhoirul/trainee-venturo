import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trainee/configs/themes/main_color.dart';
import 'package:trainee/shared/styles/google_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.icon, this.actions});

  final String title;
  final Icon? icon;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back_ios),
        color: MainColor.black,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? Container(),
              Text(
                title,
                style: GoogleTextStyle.fw600.copyWith(
                  fontSize: 20.sp,
                  color: MainColor.black,
                ),
              ),
            ],
          ),
          Container(
            width: 40.w,
          ),
        ],
      ),
      actions: [
        if (actions != null) ...actions!,
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ), 
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     width: double.infinity,
  //     height: 68.h,
  //     padding: EdgeInsets.symmetric(
  //       horizontal: 25.w,
  //       vertical: 10.h,
  //     ),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.vertical(
  //         bottom: Radius.circular(30.r),
  //       ),
  //       boxShadow: const [
  //         BoxShadow(
  //           color: Color.fromARGB(111, 24, 24, 24),
  //           blurRadius: 15,
  //           spreadRadius: -1,
  //           offset: Offset(0, 1),
  //         ),
  //       ],
  //     ),
  //     child: Center(
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           IconButton(
  //             onPressed: () {
  //               Get.back();
  //             },
  //             icon: const Icon(Icons.arrow_back_ios),
  //             color: MainColor.black,
  //           ),
  //           Expanded(
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 leadingIcon ?? Container(),
  //                 Text(
  //                   title,
  //                   style: GoogleTextStyle.fw600.copyWith(
  //                     fontSize: 20.sp,
  //                     color: MainColor.black,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Container(
  //             width: 40.w,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
