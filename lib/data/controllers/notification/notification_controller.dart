import 'package:get/get.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/modals/notification/notification_response.dart';

class NotificationController extends GetxController {
  bool isLoading = false;
  List<Notification> notifications = [];

  @override
  void onInit() {
    _fetchNotifications();
    super.onInit();
  }

  _fetchNotifications() async {
    _startLoading();

    final response = await constCtr.apis.getNotifications(
      token: constCtr.token,
    );
    _stopLoading();

    if (response != null) {
      notifications.addAll(response.notification ?? []);
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
