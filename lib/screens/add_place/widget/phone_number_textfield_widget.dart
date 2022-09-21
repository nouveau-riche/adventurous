import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/extensions.dart';
import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/controllers/add_place/add_place_controller.dart';

class PhoneNumberTextFieldWidget extends StatelessWidget {
  const PhoneNumberTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(AddPlaceController());

    return TextFormField(
      cursorColor: oliveColor,
      controller: ctr.phoneNumberCtr,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: constCtr.strings.phoneNumber,
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
          return 'Enter Phone Number';
        }
        if(value?.length != 10){
          return 'Enter valid phone number';
        }
      },
      onSaved: (value) {
        ctr.phoneNumber = value ?? '';
      },
    );
  }
}
