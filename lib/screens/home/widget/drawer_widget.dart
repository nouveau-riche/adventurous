import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/screens/about_us/about_us_screen.dart';
import 'package:adventurous_learner_app/screens/contact_us/contact_us_screen.dart';
import 'package:adventurous_learner_app/screens/learning_module/learning_modules_screen.dart';
import 'package:adventurous_learner_app/screens/notification/notification_screen.dart';
import 'package:adventurous_learner_app/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:adventurous_learner_app/screens/home/widget/drawer_header_widget.dart';
import 'package:adventurous_learner_app/screens/home/widget/drawer_tile_widget.dart';
import 'package:adventurous_learner_app/data/controllers/auth/logout_controller.dart';
import 'package:adventurous_learner_app/data/controllers/bottom_nav/bottom_nav_controller.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const DrawerHeaderWidget(),
          const SizedBox(height: 20),
          DrawerTileWidget(
            image: Assets.iconsProfile,
            text: 'Profile',
            onPressed: () {
              Get.back();
              Get.put(BottomNavController()).selectPage(3);
            },
          ),
          DrawerTileWidget(
            image: Assets.iconsBell,
            text: 'Notification',
            onPressed: () {
              Get.back();
              Get.to(
                () => const NotificationScreen(),
                transition: Transition.rightToLeft,
              );
            },
          ),
          DrawerTileWidget(
            image: Assets.iconsMap,
            text: 'View Map',
            onPressed: () {
              Get.back();
              Get.put(BottomNavController()).selectPage(1);
            },
          ),
          DrawerTileWidget(
            image: Assets.iconsAddPlace,
            text: 'Add Location',
            onPressed: () {
              Get.back();
              Get.put(BottomNavController()).selectPage(2);
            },
          ),
          DrawerTileWidget(
            image: Assets.iconsLearning,
            text: 'Learning Modules',
            onPressed: () {
              Get.back();
              Get.to(
                () => const LearningModulesScreen(),
                transition: Transition.rightToLeft,
              );
            },
          ),
          DrawerTileWidget(
            image: Assets.iconsContact,
            text: 'Contact Us',
            onPressed: () {
              Get.back();
              Get.to(
                () => const ContactUsScreen(),
                transition: Transition.rightToLeft,
              );
            },
          ),
          DrawerTileWidget(
            image: Assets.iconsAbout,
            text: 'About Us',
            onPressed: () {
              Get.back();
              Get.to(
                () => const AboutUsScreen(),
                transition: Transition.rightToLeft,
              );
            },
          ),
          DrawerTileWidget(
            image: Assets.iconsPrivacy,
            text: 'Privacy Policy',
            onPressed: () {
              Get.back();
              Get.to(
                () => const PrivacyPolicyScreen(),
                transition: Transition.rightToLeft,
              );
            },
          ),
          DrawerTileWidget(
            image: Assets.iconsShare,
            text: 'Share The App',
            onPressed: () {
              Share.share('check out adventurous app on playstore');
            },
          ),
          DrawerTileWidget(
            image: Assets.iconsBlock,
            text: 'Blog',
            onPressed: () async{
              const url = 'https://theadventurouslearner.com/#/blogs';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          DrawerTileWidget(
            image: Assets.iconsLogout,
            text: 'Logout',
            onPressed: () {
              Get.put(LogoutController()).logoutUser();
            },
          ),
        ],
      ),
    );
  }
}
