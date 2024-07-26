import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    analytics.setCurrentScreen(
      screenName: 'Splash Screen',
      screenClassOverride: 'Trainee',
    );
    return Container(
      color: Colors.white,
      child: const Center(
        child: Image(
            image: AssetImage('assets/images/java_code.png'), height: 150),
      ),
    );
  }
}
