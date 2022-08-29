import 'package:location/location.dart';

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
// import 'package:sortizy/data/modals/google_maps/place_detail_response.dart';
// import 'package:sortizy/data/modals/google_maps/places_autocomplete_response.dart';
// import 'package:sortizy/utility/common.dart';
// import 'package:sortizy/utility/constants.dart';
// import 'package:sortizy/utility/extensions.dart';

class GoogleMapsUtils {
  GoogleMapsUtils._();

  static final Location location = Location();

  static get askLocationPermission async {
    PermissionStatus permissionGranted = await location.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();

      if (permissionGranted != PermissionStatus.granted) {
        if (permissionGranted == PermissionStatus.deniedForever) {
          showSnackBar(constCtr.strings.allowLocation);
          return;
        }
        showSnackBar('Location permission are needed to fetch your location');
        askLocationPermission;
      }
    }
  }

  static Future<bool> get isLocationDeniedForever async {
    PermissionStatus permissionGranted = await location.hasPermission();
    return permissionGranted == PermissionStatus.deniedForever;
  }

  static Future<String?> fetchAddressFromLatLong(
      double latitude,
      double longitude,
      ) async {
    final response = await constCtr.apis.getPlaceDetailFromLatLong(
      latitude,
      longitude,
    );

    if (response != null && response.status == 'OK') {
      return response.results?.first.formattedAddress ?? '';
    }

    return null;
  }

  // static Future<List<PlacePrediction>> fetchSearchSuggestion(
  //     String query,
  //     ) async {
  //   if (query.isNullOrEmpty) return [];
  //
  //   final response = await constCtr.api.getAutoCompletePlaces(query);
  //
  //   if (response != null && response.status == 'OK') {
  //     return response.predictions ?? [];
  //   }
  //   return [];
  // }
  //
  // static Future<PlaceDetailResponse?> getPlaceDetailsFromId(
  //     String placeId,
  //     ) async {
  //   final response = await constCtr.api.getPlaceDetailFromId(placeId);
  //
  //   if (response != null && response.status == 'OK') {
  //     return response;
  //   }
  //
  //   return null;
  // }
}
