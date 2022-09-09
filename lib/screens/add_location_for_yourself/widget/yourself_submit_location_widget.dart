import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/widgets/rounded_elevated_bt_widget.dart';
import 'package:adventurous_learner_app/data/controllers/add_location_for_yourself/add_location_for_yourself_controller.dart';

class YourselfSubmitLocationBtWidget extends StatelessWidget {
  const YourselfSubmitLocationBtWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(AddLocationForYourself());

    return GetBuilder<AddLocationForYourself>(
      builder: (_) {
        if (ctr.isLoading) {
          return const CupertinoActivityIndicator();
        }

        return RoundedElevatedButtonWidget(
          text: Text(
            constCtr.strings.submit,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          onPressed: () => ctr.addLocation(),
          radius: 10,
        );
      },
    );
  }
}
