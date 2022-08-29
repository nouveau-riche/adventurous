import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/screens/home/widget/drawer_header_widget.dart';
import 'package:adventurous_learner_app/screens/home/widget/drawer_tile_widget.dart';
import 'package:adventurous_learner_app/data/controllers/auth/logout_controller.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DrawerHeaderWidget(),
        const SizedBox(height: 20),
        DrawerTileWidget(
          image: Assets.iconsProfile,
          text: 'Profile',
          onPressed: () {},
        ),
        DrawerTileWidget(
          image: Assets.iconsNotification,
          text: 'Notification',
          onPressed: () {},
        ),
        DrawerTileWidget(
          image: Assets.iconsMap,
          text: 'View Map',
          onPressed: () {},
        ),
        DrawerTileWidget(
          image: Assets.iconsAddPlace,
          text: 'Add Place',
          onPressed: () {},
        ),
        DrawerTileWidget(
          image: Assets.iconsLearning,
          text: 'Learning Modules',
          onPressed: () {},
        ),
        DrawerTileWidget(
          image: Assets.iconsContact,
          text: 'Contact Us',
          onPressed: () {},
        ),
        DrawerTileWidget(
          image: Assets.iconsAbout,
          text: 'About Us',
          onPressed: () {},
        ),
        DrawerTileWidget(
          image: Assets.iconsPrivacy,
          text: 'Privacy Policy',
          onPressed: () {},
        ),
        DrawerTileWidget(
          image: Assets.iconsShare,
          text: 'Share The App',
          onPressed: () {},
        ),
        DrawerTileWidget(
          image: Assets.iconsLogout,
          text: 'Logout',
          onPressed: () {
            Get.put(LogoutController()).logoutUser();
          },
        ),
      ],
    );
  }
}
