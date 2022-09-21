import 'package:get/get.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/modals/contact_us/contact_us_response.dart';

class ContactUsController extends GetxController {
  ContactDetails? details;

  @override
  void onInit() {
    _fetchContactDetails();
    super.onInit();
  }

  _fetchContactDetails() async {
    final response = await constCtr.apis.getContactDetails(
      token: constCtr.token,
    );

    if (response != null) {
      details = response.data;
      update();
    }
  }
}
