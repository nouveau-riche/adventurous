import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/screens/auth/reset_password/otp_screen.dart';
import 'package:adventurous_learner_app/data/controllers/auth/reset_password_controller.dart';

class RegisterController extends GetxController {
  bool isLoading = false;
  bool isPasswordVisible = false;

  String name = '';
  String email = '';
  String password = '';

  final formKey = GlobalKey<FormState>();

  get register async {
    if (!(formKey.currentState ?? FormState()).validate()) return;

    (formKey.currentState ?? FormState()).save();

    _startLoading();

    hideKeyBoard();

    final response = await constCtr.apis.checkEmailRegister(email);

    _stopLoading();

    if (response == null) return;

    Get.put(ResetPasswordController()).receivedOtp = response.otp.toString();

    Get.to(
      () => const OtpScreen(),
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
