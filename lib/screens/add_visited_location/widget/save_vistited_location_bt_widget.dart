import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/widgets/rounded_elevated_bt_widget.dart';
import 'package:adventurous_learner_app/data/controllers/add_visited_location/add_visited_location_controller.dart';

class SaveVisitedLocationBtWidget extends StatelessWidget {
  const SaveVisitedLocationBtWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(AddVisitedLocationController());

    return Padding(
      padding: const EdgeInsets.all(35),
      child: GetBuilder<AddVisitedLocationController>(
        builder: (_) {
          if (ctr.isLoading) {
            return const CupertinoActivityIndicator();
          }

          return RoundedElevatedButtonWidget(
            text: Text(
              constCtr.strings.save,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onPressed: () => ctr.saveVisitedLocation(),
            radius: 10,
          );
        },
      ),
    );
  }
}
