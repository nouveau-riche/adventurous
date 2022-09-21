import 'package:get/get.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/modals/home/home_content_response.dart';

class HomeController extends GetxController {
  bool isLoading = false;

  ContentData? homeScreenContent;
  String name = '';

  _fetchHomeScreenContent() async {
    _startLoading();

    final response = await constCtr.apis.getHomeScreenContent(constCtr.token);

    _stopLoading();

    if (response != null && response.status!) {
      homeScreenContent = response.contentData;
      name = response.name ?? '';
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

  @override
  void onInit() {
    _fetchHomeScreenContent();
    super.onInit();
  }
}
