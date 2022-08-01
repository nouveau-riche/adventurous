import 'package:get/get.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/screens/splash/splash_screen.dart';

class LogoutController extends GetxController {
  logoutUser() {
    constCtr.prefRepo.clearPreferences();
    Get.offAll(() => const SplashScreen());
  }
}
