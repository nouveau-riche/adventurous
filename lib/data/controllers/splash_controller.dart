import 'package:get/get.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/extensions.dart';
import 'package:adventurous_learner_app/screens/auth/login/login_screen.dart';
import 'package:adventurous_learner_app/data/controllers/constant_controller.dart';
import 'package:adventurous_learner_app/screens/bottom_nav/bottom_nav_screen.dart';

class SplashController extends GetxController {
  startTimerForNavigation() async {
    String? userXAccessToken = await constCtr.prefRepo.getUserXAccessToken();

    if (userXAccessToken.isNullOrEmpty) {
      Future.delayed(const Duration(milliseconds: 1000)).then((value) async {
        Get.offAll(() => const LoginScreen());
      });

      return;
    }

    Get.put(ConstantController()).updateToken(userXAccessToken ?? '');
    Get.offAll(() => const BottomNavScreen());
  }
}
