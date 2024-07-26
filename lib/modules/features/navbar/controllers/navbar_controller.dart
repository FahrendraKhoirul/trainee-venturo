import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainee/modules/features/navbar/modules/home/views/ui/home_view.dart';
import 'package:trainee/modules/features/navbar/modules/profile/views/ui/profile_view.dart';

class NavbarController extends GetxController {
  static NavbarController get to => Get.find();

  RxInt selectedIndex = 0.obs;
  static List<Widget> screens = [
    const HomeView(),
    const Center(child: Text("Order")),
    const ProfileView(),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
