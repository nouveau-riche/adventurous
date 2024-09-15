import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/widgets/notification_bt_widget.dart';
import 'package:adventurous_learner_app/screens/home/widget/drawer_widget.dart';
import 'package:adventurous_learner_app/screens/profile/widget/edit_profile_bt_widget.dart';
import 'package:adventurous_learner_app/screens/profile/widget/person_detail_widget.dart';
import 'package:adventurous_learner_app/screens/profile/widget/visited_location_parent_widget.dart';
import 'package:adventurous_learner_app/screens/profile/widget/add_new_visited_location_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: const SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              EditProfileBtWidget(),
              PersonalDetailWidget(),
              AddNewVisitedLocationWidget(),
              VisitedLocationParentWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
