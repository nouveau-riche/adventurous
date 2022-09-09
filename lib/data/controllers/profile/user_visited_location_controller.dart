import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';
import 'package:adventurous_learner_app/data/modals/profile/visited_location_response.dart';

class UserVisitedLocationController extends GetxController {
  bool isLoading = false;

  final searchCtr = TextEditingController();

  List<UserLocationList> allPlaces = [];
  List<LocationDetail> locations = [];

  @override
  void onInit() {
    fetchUserVisitedLocation();
    super.onInit();
  }

  fetchUserVisitedLocation() async {
    _startLoading();

    String token = await constCtr.prefRepo.getUserXAccessToken() ?? '';

    final response = await constCtr.apis.getUserLocation(token);

    _stopLoading();

    if (response != null) {
      locations.clear();
      allPlaces.clear();

      allPlaces.addAll(response.data ?? []);

      for (int i = 0; i < allPlaces.length; i++) {
        if ((allPlaces[i].locations ?? []).isNotEmpty) {
          locations.addAll(allPlaces[i].locations ?? []);
        }
      }

      locations.addAll(response.userLocations ?? []);

      update();
    }
  }

  _startLoading() {
    isLoading = true;
    update();
  }

  _stopLoading() {
    isLoading = false;
    update();
  }
}
