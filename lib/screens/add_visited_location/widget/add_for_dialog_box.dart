import 'package:adventurous_learner_app/screens/add_place/add_place_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/widgets/rounded_elevated_bt_widget.dart';
import 'package:adventurous_learner_app/data/controllers/add_visited_location/add_location_for_controller.dart';
import 'package:adventurous_learner_app/screens/add_location_for_yourself/add_location_for_yourself_screen.dart';

addForDialog() {
  final ctr = Get.put(AddLocationForController());

  return Get.dialog(
    AlertDialog(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      content: GetBuilder<AddLocationForController>(
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Do you want to add it?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                onTap: () => ctr.updateFor(),
                minVerticalPadding: 0,
                minLeadingWidth: 12,
                leading: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: greyColor8, width: 1.2),
                  ),
                  padding: const EdgeInsets.all(3),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor:
                        ctr.forYourself ? greyColor8 : Colors.white,
                  ),
                ),
                title: const Text('For Yourself'),
              ),
              ListTile(
                onTap: () => ctr.updateFor(),
                minVerticalPadding: 0,
                minLeadingWidth: 12,
                leading: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: greyColor8, width: 1.2),
                  ),
                  padding: const EdgeInsets.all(3),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor:
                        !ctr.forYourself ? greyColor8 : Colors.white,
                  ),
                ),
                title: const Text('For Everyone'),
              ),
              const SizedBox(height: 24),
              RoundedElevatedButtonWidget(
                width: 170,
                height: 42,
                text: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Get.back();

                  if (ctr.forYourself) {
                    Get.to(
                      () => const AddLocationForYourselfScreen(),
                      transition: Transition.rightToLeft,
                    );
                  } else {
                    Get.to(
                      () => const AddPlaceScreen(isNotTabScreen: true),
                      transition: Transition.rightToLeft,
                    );
                  }
                },
                radius: 10,
              ),
            ],
          );
        },
      ),
    ),
  );
}
