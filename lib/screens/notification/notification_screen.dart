import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';
import 'package:adventurous_learner_app/screens/notification/widget/notification_widget.dart';
import 'package:adventurous_learner_app/utils/widgets/shimmer/learning_module_shimmer_widget.dart';
import 'package:adventurous_learner_app/data/controllers/notification/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(NotificationController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: oliveColor,
        leading: const BackButtonWidget(color: Colors.white),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: GetBuilder<NotificationController>(
        builder: (_) {
          if (ctr.isLoading && ctr.notifications.isEmpty) {
            return const LearningModuleShimmerWidget();
          }

          if (ctr.notifications.isEmpty) {
            return const Center(
              child: Text(
                'No Notifications found',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemBuilder: (_, index) {
              return NotificationWidget(notification: ctr.notifications[index]);
            },
            itemCount: ctr.notifications.length,
            shrinkWrap: true,
          );
        },
      ),
    );
  }
}
