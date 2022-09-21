import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/extensions.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/controllers/auth/register_controller.dart';

class RegisterNameFieldWidget extends StatelessWidget {
  const RegisterNameFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(RegisterController());

    return TextFormField(
      cursorColor: oliveColor,
      decoration: InputDecoration(
        hintText: constCtr.strings.enterName,
        hintStyle: const TextStyle(
          color: kHintTextColor,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: oliveColor),
        ),
        icon: Image.asset(
          Assets.iconsProfile,
          height: 20,
          color: kTextFieldIconColor,
        ),
      ),
      validator: (value) {
        if (value.isNullOrEmpty) {
          return 'Enter name';
        }
      },
      onSaved: (value) {
        ctr.name = value ?? '';
      },
    );
  }
}
