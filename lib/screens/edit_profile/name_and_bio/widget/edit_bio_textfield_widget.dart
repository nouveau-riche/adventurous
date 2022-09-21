import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/extensions.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/controllers/edit_profile/edit_name_and_bio_controller.dart';

class EditBioTextFieldWidget extends StatelessWidget {
  const EditBioTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(EditNameAndBioController());

    return TextFormField(
      cursorColor: oliveColor,
      maxLines: 2,
      decoration: InputDecoration(
        hintText: constCtr.strings.newBio,
        hintStyle: const TextStyle(
          color: kHintTextColor,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: greyColor5, width: 1.4),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: oliveColor, width: 1.4),
          borderRadius: BorderRadius.circular(6),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 0.9),
          borderRadius: BorderRadius.circular(6),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 0.9),
          borderRadius: BorderRadius.circular(6),
        ),
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Image.asset(
            Assets.iconsBio,
            height: 18,
            color: kTextFieldIconColor,
          ),
        ),
      ),
      initialValue: ctr.bio,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return 'Enter bio';
        }
      },
      onSaved: (value) {
        ctr.bio = value ?? '';
      },
    );
  }
}
