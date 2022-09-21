import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/controllers/constant_controller.dart';
import 'package:adventurous_learner_app/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class LoginController extends GetxController {
  bool isLoading = false;
  bool isPasswordVisible = true;

  String email = '';
  String password = '';

  final formKey = GlobalKey<FormState>();

  get loginUser async {
    if (!(formKey.currentState ?? FormState()).validate()) return;

    (formKey.currentState ?? FormState()).save();

    _startLoading();

    hideKeyBoard();

    final status = await OneSignal.shared.getDeviceState();

    printLog('This is platformId: ');
    printLog(status?.userId ?? '');

    final response = await constCtr.apis.loginUser(
      email,
      password,
      status?.userId ?? '',
      Platform.isAndroid ? 'ANDROID' : 'IOS',
    );

    _stopLoading();

    if (response == null) return;

    constCtr.prefRepo.setUserXAccessToken(response.xaccessToken);
    Get.put(ConstantController()).updateToken(response.xaccessToken ?? '');

    Get.offAll(
      () => const BottomNavScreen(),
      transition: Transition.rightToLeft,
    );
  }

  changePasswordVisibility() {
    isPasswordVisible = !(isPasswordVisible);
    update();
  }

  _startLoading() {
    isLoading = true;
    update();
  }

  _stopLoading() {
    isLoading = false;
    update();
  }
}
