import 'package:adventurous_learner_app/data/controllers/auth/reset_password_controller.dart';
import 'package:adventurous_learner_app/screens/auth/reset_password/otp_screen.dart';
import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ResetMailController extends GetxController {
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String email = "";

  generateOtp() async {
    if (!(formKey.currentState ?? FormState()).validate()) return;

    (formKey.currentState ?? FormState()).save();

    _startLoading();

    hideKeyBoard();

    String token = await constCtr.prefRepo.getUserXAccessToken() ?? '';

    final response = await constCtr.apis.checkEmailExists(
      email: email,
      token: token,
    );

    _stopLoading();

    if (response == null) return;

    final ctr = Get.put(ResetPasswordController());

    ctr.receivedOtp = response.otp.toString();
    ctr.email = email;

    Get.to(
      () => const OtpScreen(isResetEmail: true),
      transition: Transition.rightToLeft,
    );
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
