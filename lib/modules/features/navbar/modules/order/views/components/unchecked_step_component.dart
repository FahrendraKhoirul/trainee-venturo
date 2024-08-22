import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UncheckedStepComponent extends StatelessWidget {
  const UncheckedStepComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [],
      ),
      child: Icon(
        Icons.circle,
        color: Colors.black45,
        size: 18.r,
      ),
    );
  }
}
