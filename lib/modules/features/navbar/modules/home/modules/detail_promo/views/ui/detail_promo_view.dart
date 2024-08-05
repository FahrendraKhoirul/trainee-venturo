import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainee/modules/features/navbar/modules/home/modules/detail_promo/controllers/detail_promo_controller.dart';
import 'package:trainee/shared/customs/custom_app_bar.dart';
import 'package:trainee/shared/customs/promo_card.dart';

class DetailPromoView extends StatelessWidget {
  DetailPromoView({super.key});

  // call controller
  final DetailPromoController controller = Get.put(DetailPromoController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: const CustomAppBar(
          title: "Detail Promo",
          leadingIcon: Icon(Icons.discount_rounded),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: PromoCard(
                  width: double.maxFinite,
                  isVoucher: controller.arg.type == "voucher" ? true : false,
                  promoName: controller.arg.nama!,
                  discountNominal: controller.arg.nominal.toString(),
                  thumbnailUrl: controller.arg.foto ??
                      "https://javacode.landa.id/img/promo/gambar_62661b52223ff.png",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
