import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';
import 'package:adventurous_learner_app/screens/home/widget/drawer_widget.dart';
import 'package:adventurous_learner_app/utils/widgets/notification_bt_widget.dart';
import 'package:adventurous_learner_app/screens/add_place/widget/submit_add_place_bt_widget.dart';
import 'package:adventurous_learner_app/screens/add_place/widget/add_location_form_parent_widget.dart';

class AddPlaceScreen extends StatelessWidget {
  final bool isNotTabScreen;

  const AddPlaceScreen({
    Key? key,
    this.isNotTabScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isNotTabScreen
          ? AppBar(
              backgroundColor: oliveColor,
              title: const Text(
                'For Everyone',
                style: TextStyle(color: Colors.white),
              ),
              elevation: 0,
              centerTitle: true,
              leading: const BackButtonWidget(color: Colors.white),
            )
          : AppBar(
              backgroundColor: oliveColor,
              title: Text(
                constCtr.strings.appName,
                style: const TextStyle(color: Colors.white),
              ),
              elevation: 0,
              centerTitle: true,
              actions: const [NotificationBtWidget()],
            ),
      drawer: const Drawer(child: DrawerWidget()),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              AddLocationFormParentWidget(isNotTabScreen: isNotTabScreen),
              const SizedBox(height: 60),
              SubmitAddPlaceBtWidget(isNotTabScreen: isNotTabScreen),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
