import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/data/controllers/bottom_nav/bottom_nav_controller.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(BottomNavController());

    return GetBuilder<BottomNavController>(
      builder: (_) {
        return Scaffold(
          body: IndexedStack(
            index: ctr.currentPageIndex,
            children: ctr.navigationScreens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 8,
            enableFeedback: true,
            type: BottomNavigationBarType.fixed,
            onTap: (index) => ctr.selectPage(index),
            currentIndex: ctr.currentPageIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            selectedItemColor: oliveColor,
            unselectedItemColor: oliveColor,
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              color: oliveColor,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              color: oliveColor,
              fontWeight: FontWeight.w600,
            ),
            items: [
              BottomNavigationBarItem(
                tooltip: '',
                icon: Image.asset(
                  ctr.isShowingHomeScreen
                      ? Assets.iconsHomeFilled
                      : Assets.iconsHome,
                  height: 20,
                  color: oliveColor,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                tooltip: '',
                icon: Image.asset(
                  ctr.isShowingMapScreen
                      ? Assets.iconsMapFilled
                      : Assets.iconsMap,
                  height: 20,
                  color: oliveColor,
                ),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                tooltip: '',
                icon: Image.asset(
                  ctr.isShowingAddPlaceScreen
                      ? Assets.iconsAddPlaceFilled
                      : Assets.iconsAddPlace,
                  height: 20,
                  color: oliveColor,
                ),
                label: 'Add Location',
              ),
              BottomNavigationBarItem(
                tooltip: '',
                icon: Image.asset(
                  ctr.isShowingProfileScreen
                      ? Assets.iconsProfileFilled
                      : Assets.iconsProfile,
                  height: 20,
                  color: oliveColor,
                ),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
