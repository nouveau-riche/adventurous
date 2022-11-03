import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/extensions.dart';
import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/controllers/add_location_for_yourself/add_location_for_yourself_controller.dart';

class YourselfPhoneNumberFieldWidget extends StatelessWidget {
  const YourselfPhoneNumberFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(AddLocationForYourself());

    return TextFormField(
      cursorColor: oliveColor,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: constCtr.strings.locationContactNumber,
        hintStyle: const TextStyle(
          color: kHintTextColor,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor5, width: 1.4),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: oliveColor, width: 1.4),
        ),
        icon: Image.asset(
          Assets.iconsPhone,
          height: 20,
          width: 20,
          color: kTextFieldIconColor,
        ),
      ),
      validator: (value) {
        if (value.isNullOrEmpty) {
          return 'Enter Location Contact Number';
        }
        if ((value?.length ?? 0) < 7) {
          return 'Enter Valid Contact Number';
        }
      },
      onSaved: (value) {
        ctr.phoneNumber = value ?? '';
      },
    );
  }
}
