import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/controllers/review/review_controller.dart';
import 'package:adventurous_learner_app/screens/place_detail/place_detail_screen.dart';
import 'package:adventurous_learner_app/data/controllers/map/map_controller.dart';
import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';

class LocationDetailController extends GetxController {
  bool isLoading = false;
  bool _noMoreResult = false;
  ScrollController scrollCtr = ScrollController();

  double latitude = 0.0;
  double longitude = 0.0;
  int _currentPage = 0;

  List<LocationDetail> locationDetails = [];

  @override
  onInit() {
    _initScrollListener();
    super.onInit();
  }

  fetchLocationDetails(double lat, double long) async {
    if (latitude == 0.0 && longitude == 0.0) {
      latitude = lat;
      longitude = long;
    }

    _startLoading();

    String token = await constCtr.prefRepo.getUserXAccessToken() ?? '';

    final response = await constCtr.apis.getLocationDetails(
      lat,
      long,
      token,
      _currentPage * 10,
      10,
    );

    _stopLoading();

    if (response != null && response.status!) {
      locationDetails.addAll(response.data ?? []);
      update();

      if ((response.total ?? 0) < (_currentPage + 1) * 10) {
        _noMoreResult = true;
      }

      Get.put(MapController()).addMarkerForAllLocation(locationDetails);
    }
  }

  fetchLocationDetailsAfterAddingReview(int index) async {
    _startLoading();

    final mapCtr = Get.put(MapController());

    // double lat = mapCtr.currentLatitude ?? defaultLatitude;
    // double long = mapCtr.currentLongitude ?? defaultLongitude;

    double lat = defaultLatitude;
    double long = defaultLongitude;

    String token = await constCtr.prefRepo.getUserXAccessToken() ?? '';

    final response = await constCtr.apis.getLocationDetails(
      lat,
      long,
      token,
      0,
      (_currentPage+1) * 10,
    );

    _stopLoading();

    if (response != null && response.status!) {
      showSnackBar('Review Added Successfully');
      Get.put(ReviewController()).stopLoading();

      locationDetails.clear();
      locationDetails.addAll(response.data ?? []);
      update();

      Navigator.of(Get.context!).pop();
      Navigator.of(Get.context!).pop();

      Get.to(
        () => PlaceDetailScreen(
          location: locationDetails[index],
          index: index,
        ),
        transition: Transition.rightToLeft,
      );
    }
  }

  _updatePage() {
    _currentPage++;
  }

  _paginationMethod() {
    if (isLoading || _noMoreResult) return;

    _updatePage();
    fetchLocationDetails(latitude, longitude);
  }

  listEndReached() {
    _paginationMethod();
  }

  _initScrollListener() async {
    scrollCtr.addListener(() {
      var nextPageTrigger = 0.8 * scrollCtr.position.maxScrollExtent;
      if (scrollCtr.position.pixels > nextPageTrigger) {
        printLog("List end reached...");

        listEndReached();
      }
    });
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
