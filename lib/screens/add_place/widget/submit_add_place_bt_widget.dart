import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/widgets/rounded_elevated_bt_widget.dart';
import 'package:adventurous_learner_app/data/controllers/add_place/add_place_controller.dart';

class SubmitAddPlaceBtWidget extends StatelessWidget {
  final bool isNotTabScreen;

  const SubmitAddPlaceBtWidget({
    Key? key,
    required this.isNotTabScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(AddPlaceController());

    return GetBuilder<AddPlaceController>(
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
          onPressed: () => ctr.addLocation(isNotTabScreen: isNotTabScreen),
          radius: 10,
        );
      },
    );
  }
}
