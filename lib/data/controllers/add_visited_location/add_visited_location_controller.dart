import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/utils/extensions.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/controllers/profile/user_visited_location_controller.dart';
import 'package:adventurous_learner_app/screens/add_place/widget/submit_add_place_dialog_widget.dart';
import 'package:adventurous_learner_app/data/modals/add_visited_location/search_location_response.dart';

class AddVisitedLocationController extends GetxController {
  bool isLoading = false;

  String searchText = '';

  final locationNameCtr = TextEditingController();
  final locationAddressCtr = TextEditingController();

  List<SearchedLocation> allSearchLocations = [];
  SearchedLocation? selectedLocation;

  saveVisitedLocation() async {
    if (locationNameCtr.text.isNullOrEmpty) {
      showSnackBar('Enter Location Name', isError: true);
      return;
    }

    if (locationAddressCtr.text.isNullOrEmpty) {
      showSnackBar('Enter Location Address', isError: true);
      return;
    }

    _startLoading();

    String token = await constCtr.prefRepo.getUserXAccessToken() ?? '';

    final response = await constCtr.apis.addVisitedLocation(
      token: token,
      locationId: selectedLocation?.locationId ?? '',
    );

    _stopLoading();

    if (response) {
      submitAddPlaceDialog(
        "Location is added on your\nprofile",
        () {
          Get.back();
          Get.back();
        },
      );
    }

    Get.put(UserVisitedLocationController()).fetchUserVisitedLocation();
  }

  fetchLocationForSearching(String query) async {
    if (query.isEmpty) return;

    String token = await constCtr.prefRepo.getUserXAccessToken() ?? '';

    final response = await constCtr.apis.searchLocation(
      token: token,
      query: query,
    );

    if (response != null) {
      allSearchLocations.clear();
      allSearchLocations.addAll(response.data ?? []);
      update();
    }
  }

  List<SearchedLocation?> getLocationsSuggestion(String query) =>
      allSearchLocations.where((element) {
        final elementLower = (element.name ?? '').toLowerCase();
        final queryLower = query.toLowerCase();

        return elementLower.contains(queryLower);
      }).toList();

  onSuggestionSelected(SearchedLocation? suggestion) {
    locationNameCtr.text = suggestion?.name ?? '';
    locationAddressCtr.text = suggestion?.address ?? '';
    selectedLocation = suggestion;
    searchText = '';
    hideKeyBoard();
    update();
  }

  _startLoading() {
    isLoading = true;
    update();
  }

  _stopLoading() {
    isLoading = false;
    update();
  }

  updateSearchText(String value) {
    searchText = value;
    update();
  }
}
