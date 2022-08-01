import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/screens/bottom_nav/bottom_nav_screen.dart';

class LoginController extends GetxController {
  bool isLoading = false;
  bool isPasswordVisible = false;

  String email = '';
  String password = '';

  final formKey = GlobalKey<FormState>();

  get loginUser async {
    if (!(formKey.currentState ?? FormState()).validate()) return;

    (formKey.currentState ?? FormState()).save();

    _startLoading();

    hideKeyBoard();

    final response = await constCtr.apis.loginUser(email, password);

    _stopLoading();

    if (response == null) return;

    constCtr.prefRepo.setUserXAccessToken(response.xaccessToken);

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
