import 'package:get/get.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/modals/learning_module/learning_module_response.dart';

class LearningModuleController extends GetxController {
  bool isLoading = false;
  List<Module> modules = [];

  @override
  void onInit() {
    _fetchLearningModules();
    super.onInit();
  }

  _fetchLearningModules() async {
    _startLoading();

    final response = await constCtr.apis.getLearningModules(
      token: constCtr.token,
    );

    _stopLoading();

    if (response != null) {
      modules.addAll(response.data ?? []);
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
