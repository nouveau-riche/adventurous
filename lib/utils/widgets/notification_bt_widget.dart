import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/screens/notification/notification_screen.dart';

class NotificationBtWidget extends StatelessWidget {
  const NotificationBtWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      onPressed: () {
        Get.to(
          () => const NotificationScreen(),
          transition: Transition.rightToLeft,
        );
      },
      icon: Image.asset(
        Assets.iconsBell,
        height: 20,
        width: 20,
      ),
    );
  }
}
