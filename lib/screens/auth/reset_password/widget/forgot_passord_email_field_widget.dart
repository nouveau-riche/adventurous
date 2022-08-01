import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/extensions.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/controllers/auth/reset_password_controller.dart';

class ForgotPasswordEmailFieldWidget extends StatelessWidget {
  const ForgotPasswordEmailFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(ResetPasswordController());

    return TextFormField(
      cursorColor: greenColor2,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: constCtr.strings.email,
        hintStyle: const TextStyle(
          color: kHintTextColor,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: greenColor2),
        ),
        icon: const Icon(
          Icons.alternate_email_outlined,
          size: 20,
          color: kTextFieldIconColor,
        ),
      ),
      validator: (value) {
        if (value.isNullOrEmpty) {
          return 'Enter email';
        }
        if (!GetUtils.isEmail(value ?? '')) {
          return 'Enter a valid email';
        }
      },
      onSaved: (value) {
        ctr.email = value ?? '';
      },
    );
  }
}
