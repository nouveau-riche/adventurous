import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/screens/add_visited_location/widget/add_for_dialog_box.dart';

class DidntFindLocationWidget extends StatelessWidget {
  const DidntFindLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Didn’t find your location? ",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: kHintTextColor,
          ),
        ),
        TextButton(
          onPressed: () {
            addForDialog();
          },
          child: const Text(
            'Add New Location',
            style: TextStyle(color: oliveColor, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
