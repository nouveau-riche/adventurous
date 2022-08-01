import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';

class AlreadyHaveAccountBtWidget extends StatelessWidget {
  const AlreadyHaveAccountBtWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          constCtr.strings.alreadyHaveAccount,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: kHintTextColor,
          ),
        ),
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            constCtr.strings.login,
            style: const TextStyle(color: greenColor1, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
