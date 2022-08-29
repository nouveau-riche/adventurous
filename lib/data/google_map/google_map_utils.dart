import 'package:location/location.dart';

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/utils/constants.dart';

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
}
