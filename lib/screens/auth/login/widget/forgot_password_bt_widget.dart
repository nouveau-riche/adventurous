import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/screens/auth/reset_password/forgot_password_screen.dart';

class ForgotPasswordBtWidget extends StatelessWidget {
  const ForgotPasswordBtWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Get.to(
            () => const ForgotPasswordScreen(),
            transition: Transition.downToUp,
          );
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(0, 10, 14, 8),
        ),
        child: Text(
          constCtr.strings.forgotPassword,
          style: const TextStyle(color: kHintTextColor),
        ),
      ),
    );
  }
}
