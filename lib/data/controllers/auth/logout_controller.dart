import 'package:get/get.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/screens/auth/login/login_screen.dart';

class LogoutController extends GetxController {
  logoutUser() {
    constCtr.prefRepo.clearPreferences();
    Get.offAll(() => const LoginScreen());
  }
}
