import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/controllers/add_visited_location/add_visited_location_controller.dart';

class VisitedLocationAddressWidget extends StatelessWidget {
  const VisitedLocationAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ctr = Get.put(AddVisitedLocationController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: TextField(
        controller: ctr.locationAddressCtr,
        cursorColor: greenColor2,
        decoration: InputDecoration(
          hintText: constCtr.strings.locationAddress,
          hintStyle: const TextStyle(
            color: kHintTextColor,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: greyColor5, width: 1.4),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: greenColor2, width: 1.4),
          ),
          icon: Image.asset(
            Assets.iconsAddress,
            height: 20,
            width: 20,
            color: kTextFieldIconColor,
          ),
        ),
      ),
    );
  }
}
