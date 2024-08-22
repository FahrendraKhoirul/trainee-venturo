import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee/configs/themes/main_color.dart';
import 'package:trainee/modules/features/navbar/modules/order/models/order_detail_model.dart';
import 'package:trainee/shared/styles/google_text_style.dart';

class DetailOrderCardComponent extends StatelessWidget {
  final OrderDetailDetailModel orderDetailItem;

  const DetailOrderCardComponent(this.orderDetailItem, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.all(7.r),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 2),
            blurRadius: 8,
            spreadRadius: -1,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /* Image */
          Container(
            height: 90.h,
            width: 90.w,
            margin: EdgeInsets.only(right: 12.w),
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
            child: CachedNetworkImage(
              imageUrl: orderDetailItem.foto ??
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/240px-No_image_available.svg.png',
              fit: BoxFit.contain,
              errorWidget: (context, _, __) => CachedNetworkImage(
                imageUrl:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/240px-No_image_available.svg.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderDetailItem.nama!,
                  style: GoogleTextStyle.fw500.copyWith(
                    fontSize: 23.sp,
                    color: MainColor.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 5.h),
                Text(
                  'Rp ${orderDetailItem.harga}',
                  style: GoogleTextStyle.fw500.copyWith(
                    fontSize: 18.sp,
                    color: MainColor.primary,
                  ),
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Icon(
                      Icons.notes_rounded,
                      color: MainColor.primary,
                      size: 15.r,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      orderDetailItem.catatan!.isEmpty
                          ? 'Tidak ada catatan'
                          : orderDetailItem.catatan!,
                      style: GoogleTextStyle.fw500.copyWith(
                        fontSize: 12.sp,
                        color: MainColor.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 40.w, right: 20.w),
              child: Text(
                orderDetailItem.jumlah.toString(),
                style: GoogleTextStyle.fw500
                    .copyWith(fontSize: 18.sp, color: MainColor.black),
              )),
        ],
      ),
    );
  }
}
