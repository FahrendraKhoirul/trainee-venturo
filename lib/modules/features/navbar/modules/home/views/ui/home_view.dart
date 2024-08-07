import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trainee/configs/routes/main_route.dart';
import 'package:trainee/modules/features/navbar/modules/home/controllers/home_controller.dart';
import 'package:trainee/modules/features/navbar/modules/home/views/components/menu_chip.dart';
import 'package:trainee/shared/customs/promo_card.dart';
import 'package:trainee/modules/features/navbar/modules/home/views/components/search_app_bar.dart';
import 'package:trainee/modules/features/navbar/modules/home/views/components/section_header.dart';
import 'package:trainee/modules/features/navbar/modules/home/views/components/slidable_card_component.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: SearchAppBar(
          onChange: (value) => HomeController.to.keyword(value),
        ),
        body: NestedScrollView(
            physics: const ClampingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(child: 22.verticalSpace),
                // list of promo
                const SliverToBoxAdapter(
                  child: SectionHeader(
                    icon: Icons.note_alt_outlined,
                    title: 'Available promo',
                  ),
                ),
                SliverToBoxAdapter(child: 22.verticalSpace),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: 1.sw,
                    height: 188.h,
                    child: Obx(
                      () => ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          itemBuilder: (context, index) {
                            return Obx(
                              () => PromoCard(
                                  isVoucher: HomeController
                                              .to.promoItems[index].type ==
                                          "voucher"
                                      ? true
                                      : false,
                                  enableShadow: false,
                                  promoName:
                                      HomeController.to.promoItems[index].nama!,
                                  discountNominal: HomeController
                                      .to.promoItems[index].nominal
                                      .toString(),
                                  thumbnailUrl:
                                      HomeController.to.promoItems[index].foto!,
                                  onTap: () {
                                    Get.toNamed(
                                      MainRoute.detailPromo,
                                      arguments:
                                          HomeController.to.promoItems[index],
                                    );
                                  }),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              26.horizontalSpace,
                          itemCount: HomeController.to.promoItems.length),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: 22.verticalSpace),
                // Row of categories
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: 1.sw,
                    height: 45.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: HomeController.to.categories.length,
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      itemBuilder: (context, index) {
                        final category = HomeController.to.categories[index];
                        IconData iconChip;
                        if (category == HomeController.to.categories[0]) {
                          iconChip = Icons.menu_book;
                        } else if (category ==
                            HomeController.to.categories[1]) {
                          iconChip = Icons.food_bank_outlined;
                        } else if (category ==
                            HomeController.to.categories[2]) {
                          iconChip = Icons.local_drink_rounded;
                        } else {
                          iconChip = Icons.fastfood_outlined;
                        }
                        return Obx(
                          () => MenuChip(
                            onTap: () {
                              HomeController.to.selectedCategory(category);
                            },
                            isSelected:
                                HomeController.to.selectedCategory.value ==
                                    category,
                            text: category,
                            icon: iconChip,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => 13.horizontalSpace,
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: 10.verticalSpace),
              ];
            },
            body: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  final currentCategory =
                      HomeController.to.selectedCategory.value;
                  var iconSection = Icons.menu_book;
                  if (currentCategory == HomeController.to.categories[1]) {
                    iconSection = Icons.food_bank;
                  } else if (currentCategory ==
                      HomeController.to.categories[2]) {
                    iconSection = Icons.local_drink;
                  } else if (currentCategory ==
                      HomeController.to.categories[3]) {
                    iconSection = Icons.fastfood_rounded;
                  }
                  return Container(
                    width: 1.sw,
                    height: 35.h,
                    color: Colors.grey[100],
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: SectionHeader(
                      title: currentCategory,
                      icon: iconSection,
                    ),
                  );
                }),
                Obx(
                  () => Expanded(
                    child: RefreshIndicator(
                      onRefresh: () {
                        HomeController.to.onRefresh();
                        return Future<void>.value();
                      },
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        itemCount: HomeController.to.filteredMenuList.length,
                        itemBuilder: (context, index) {
                          final item =
                              HomeController.to.filteredMenuList[index];
                          return SlidableCardComponent(item: item);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
