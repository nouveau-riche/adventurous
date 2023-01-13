import 'dart:io';

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
        child: Platform.isAndroid
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 24),
                  Image.asset(
                    Assets.imagesLogo,
                    height: 93,
                    width: 87,
                    fit: BoxFit.fill,
                  ),
                ],
              )
            : Center(
                child: Image.asset(
                  Assets.imagesLogo,
                  height: 160,
                  width: 160,
                ),
              ),
      ),
    );
  }
}
