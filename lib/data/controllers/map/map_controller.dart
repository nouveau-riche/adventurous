import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/data/google_map/google_map_utils.dart';
import 'package:adventurous_learner_app/screens/place_detail/place_detail_screen.dart';
import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';
import 'package:adventurous_learner_app/data/controllers/map/location_detail_controller.dart';

class MapController extends GetxController {
  GoogleMapController? mapController;

  Set<Marker> mapMarker = {};
  Set<Circle> circlesSet = {};

  double currentLatitude = defaultLatitude;
  double currentLongitude = defaultLongitude;

  var currentCameraPos = const CameraPosition(
    target: LatLng(defaultLatitude, defaultLongitude),
    zoom: defaultMapZoomValue,
  );

  @override
  onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _moveMarkerToCurrentLocation(),
    );
  }

  _moveMarkerToCurrentLocation() async {
    await GoogleMapsUtils.askLocationPermission;

    if (await GoogleMapsUtils.isLocationDeniedForever) {
      showSnackBar(constCtr.strings.allowLocation, isError: true);
      return;
    }

    LocationData? currentPosition;

    if (!await GoogleMapsUtils.isLocationDenied) {
      currentPosition = await GoogleMapsUtils.location.getLocation();
    }

    currentLatitude = currentPosition?.latitude ?? defaultLatitude;
    currentLongitude = currentPosition?.longitude ?? defaultLongitude;

    _moveCameraToLocation();

    _addCircleToCurrentLocation();

    Get.put(LocationDetailController()).fetchLocationDetails(
      currentLatitude,
      currentLongitude,
    );
  }

  _moveCameraToLocation() {
    currentCameraPos = CameraPosition(
      target: LatLng(
        currentLatitude,
        currentLongitude,
      ),
      zoom: defaultMapZoomValue,
    );
    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(currentCameraPos),
    );
  }

  addMarkerForAllLocation(List<LocationDetail> locationDetails) async {
    if (locationDetails.isEmpty) return;

    int index = 0;
    mapMarker.clear();

    mapMarker.add(Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(60),
      markerId: MarkerId(DateTime.now().toString()),
      position: LatLng(
        currentLatitude,
        currentLongitude,
      ),
      infoWindow: const InfoWindow(title: 'You'),
    ));

    for (var element in locationDetails) {
      mapMarker.add(Marker(
        markerId: MarkerId(DateTime.now().toString()),
        position: LatLng(
          element.location?.coordinates?[1] ?? defaultLatitude,
          element.location?.coordinates?[0] ?? defaultLongitude,
        ),
        infoWindow: InfoWindow(
          title: element.name,
          onTap: () {
            Get.to(
              () => PlaceDetailScreen(
                location: element,
                index: index,
              ),
              transition: Transition.downToUp,
            );
          },
        ),
      ));
      index++;
    }
    update();
  }

  _addCircleToCurrentLocation() {
    circlesSet.add(
      Circle(
        circleId: CircleId(DateTime.now().toString()),
        fillColor: oliveColor.withOpacity(0.25),
        center: LatLng(
          currentLatitude,
          currentLongitude,
        ),
        radius: 120,
        strokeColor: oliveColor,
        strokeWidth: 2,
      ),
    );
    update();
  }
}
