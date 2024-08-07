import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee/configs/themes/main_color.dart';
import 'package:trainee/shared/styles/google_text_style.dart';

class MenuChip extends StatelessWidget {
  final bool isSelected;
  final String text;
  final Function()? onTap;
  final IconData? icon;

  const MenuChip({
    Key? key,
    this.isSelected = false,
    required this.text,
    this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30.r),
      child: Ink(
        padding: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: isSelected ? MainColor.black : MainColor.primary,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 8,
              spreadRadius: -1,
              color: Colors.black54,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: MainColor.white,
              size: 16.sp,
            ),
            SizedBox(width: 5.w),
            Text(
              text,
              style: GoogleTextStyle.fw600.copyWith(
                fontSize: 16.sp,
                color: MainColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
