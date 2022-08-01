import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/screens/auth/login/login_screen.dart';
import 'package:adventurous_learner_app/data/controllers/auth/register_controller.dart';
import 'package:adventurous_learner_app/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:adventurous_learner_app/screens/auth/reset_password/otp_screen.dart';
import 'package:adventurous_learner_app/screens/auth/reset_password/reset_password_screen.dart';

class ResetPasswordController extends GetxController {
  bool isLoading = false;
  bool isPasswordVisible = false;

  String email = '';
  final pinCtr = TextEditingController();

  String receivedOtp = '';

  String enteredOtp = '';
  String newPassword = '';
  String confirmNewPassword = '';

  final formKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();
  final resetPasswordFormKey = GlobalKey<FormState>();

  verifyPin({isResetPassword = false}) async {
    if (!(otpFormKey.currentState ?? FormState()).validate()) return;

    (otpFormKey.currentState ?? FormState()).save();

    if (receivedOtp != enteredOtp) {
      showSnackBar('OTP is not correct', isError: true);
      return;
    }

    if (isResetPassword) {
      Get.to(
        () => const ResetPasswordScreen(),
        transition: Transition.rightToLeft,
      );
    } else {
      final ctr = Get.put(RegisterController());

      _startLoading();

      final response = await constCtr.apis.registerUser(
        ctr.email,
        ctr.name,
        ctr.password,
      );

      _stopLoading();

      if (response == null) return;

      constCtr.prefRepo.setUserXAccessToken(response.xaccesstoken);

      Get.offAll(
        () => const BottomNavScreen(),
        transition: Transition.rightToLeft,
      );
    }
  }

  changePasswordVisibility() {
    isPasswordVisible = !(isPasswordVisible);
    update();
  }

  get generateOtp async {
    if (!(formKey.currentState ?? FormState()).validate()) return;

    (formKey.currentState ?? FormState()).save();

    _startLoading();

    final response = await constCtr.apis.forgotPassword(email);

    _stopLoading();

    if (response == null) return;

    receivedOtp = response.otp.toString();

    pinCtr.clear();

    Get.to(
      () => const OtpScreen(isResetPassword: true),
      transition: Transition.rightToLeft,
    );
  }

  get resetPassword async {
    if (!(resetPasswordFormKey.currentState ?? FormState()).validate()) return;

    (resetPasswordFormKey.currentState ?? FormState()).save();

    if (newPassword != confirmNewPassword) {
      return showSnackBar('Password do not matches', isError: true);
    }

    _startLoading();

    final response = await constCtr.apis.updatePassword(email, newPassword);

    _stopLoading();

    if (response == null) return;

    Get.offAll(
      () => const LoginScreen(),
      transition: Transition.downToUp,
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
