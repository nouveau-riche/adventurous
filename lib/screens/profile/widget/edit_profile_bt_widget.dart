import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/screens/edit_profile/edit_profile_bottom_sheet.dart';

class EditProfileBtWidget extends StatelessWidget {
  const EditProfileBtWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        splashColor: Colors.white,
        onPressed: () => editProfileBottomSheet(),
        icon: Image.asset(
          Assets.iconsEdit,
          height: 19,
          width: 19,
          color: oliveColor,
        ),
      ),
    );
  }
}
