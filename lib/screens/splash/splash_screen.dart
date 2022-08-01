import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/data/controllers/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Get.put(SplashController()).startTimerForNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.imagesLogo,
          height: 280,
          width: 280,
        ),
      ),
    );
  }
}
