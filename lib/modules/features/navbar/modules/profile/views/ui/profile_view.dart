import 'package:flutter/material.dart';
import 'package:trainee/modules/global_controllers/global_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Profile"),
            GestureDetector(
              onTap: () {
                GlobalController.to.logout();
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
