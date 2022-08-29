import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/screens/add_place/add_place_screen.dart';
import 'package:adventurous_learner_app/screens/home/home_screen.dart';
import 'package:adventurous_learner_app/screens/map/map_screen.dart';
import 'package:adventurous_learner_app/screens/profile/profile_screen.dart';

class BottomNavController extends GetxController {
  int currentPageIndex = 0;

  List<Widget> navigationScreens = const [
    HomeScreen(),
    MapScreen(),
    AddPlaceScreen(),
    ProfileScreen(),
  ];

  get isShowingHomeScreen => currentPageIndex == 0;

  get isShowingMapScreen => currentPageIndex == 1;

  get isShowingAddPlaceScreen => currentPageIndex == 2;

  get isShowingProfileScreen => currentPageIndex == 3;

  Widget get getCurrentScreen => navigationScreens[currentPageIndex];

  selectPage(int value) {
    currentPageIndex = value;
    update();
  }
}
