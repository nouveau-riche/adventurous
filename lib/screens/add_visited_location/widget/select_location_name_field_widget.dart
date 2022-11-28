import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/data/controllers/add_visited_location/add_visited_location_controller.dart';

class SelectLocationNameFieldWidget extends StatelessWidget {
  const SelectLocationNameFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(AddVisitedLocationController());

    return GetBuilder<AddVisitedLocationController>(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: TextField(
            cursorColor: oliveColor,
            controller: ctr.locationNameCtr,
            decoration: InputDecoration(
              icon: Image.asset(
                Assets.iconsLearning,
                height: 20,
                width: 20,
                color: kTextFieldIconColor,
              ),
              hintText: 'Select Location Name',
              hintStyle: const TextStyle(
                color: kHintTextColor,
                fontWeight: FontWeight.w500,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor5, width: 1.4),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor5, width: 1.4),
              ),
            ),
            onChanged: (value) {
              if (value.length > 3) {
                ctr.fetchLocationForSearching(value);
              }
              ctr.updateSearchText(value);
            },
          ),
        );
      },
    );
  }
}
