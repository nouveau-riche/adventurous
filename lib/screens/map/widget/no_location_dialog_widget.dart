import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/widgets/rounded_elevated_bt_widget.dart';

noLocationDialog() {
  return Get.dialog(
    AlertDialog(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            backgroundColor: oliveColor,
            radius: 28,
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(height: 26),
          const Text(
            'No location found for current filter',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 26),
          RoundedElevatedButtonWidget(
            width: 170,
            height: 42,
            text: Text(
              constCtr.strings.close,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onPressed: () => Get.back(),
            radius: 10,
          ),
        ],
      ),
    ),
  );
}
