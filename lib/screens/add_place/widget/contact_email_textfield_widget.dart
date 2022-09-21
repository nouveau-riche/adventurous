import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/extensions.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/controllers/add_place/add_place_controller.dart';

class ContactEmailTextFieldWidget extends StatelessWidget {
  const ContactEmailTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(AddPlaceController());

    return TextFormField(
      cursorColor: oliveColor,
      controller: ctr.emailCtr,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: constCtr.strings.yourContactEmail,
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
        icon: const Icon(
          Icons.alternate_email_outlined,
          size: 20,
          color: kTextFieldIconColor,
        ),
      ),
      validator: (value) {
        if (value.isNullOrEmpty) {
          return 'Enter Contact Email';
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
