import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Image(
            image: AssetImage('assets/images/java_code.png'), height: 150),
      ),
    );
  }
}
