import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/screens/add_place/widget/submit_add_place_dialog_widget.dart';

class AddPlaceController extends GetxController {
  bool isLoading = false;

  String locationName = "";
  String learningOpp = "";
  String website = "";
  String address = "";
  String phoneNumber = "";
  String name = "";
  String email = "";

  final locationNameCtr = TextEditingController();
  final learningOppCtr = TextEditingController();
  final websiteCtr = TextEditingController();
  final addressCtr = TextEditingController();
  final phoneNumberCtr = TextEditingController();
  final nameCtr = TextEditingController();
  final emailCtr = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  addLocation({isNotTabScreen = false}) async {
    if (isNotTabScreen) {
      if (!(formKey2.currentState ?? FormState()).validate()) return;

      (formKey2.currentState ?? FormState()).save();
    } else {
      if (!(formKey.currentState ?? FormState()).validate()) return;

      (formKey.currentState ?? FormState()).save();
    }

    _startLoading();

    String token = await constCtr.prefRepo.getUserXAccessToken() ?? '';

    if (isNotTabScreen) {
      final response = await constCtr.apis.addLocationForYourself(
        type: 'EVERYONE',
        address: address,
        name: locationName,
        contactNo: phoneNumber,
        countryCode: '+91',
        website: website,
        description: 'description',
        learningOpp: learningOpp,
        rating: 0,
        text: '',
        yourName: name,
        email: email,
        token: token,
        images: [],
      );

      _stopLoading();

      if (response) {
        submitAddPlaceDialog(
          constCtr.strings.itStartShowingAfterVerify,
          () {
            Get.back();
            Get.back();
            Get.back();
          },
        );
      }

      clearFields();

      return;
    }

    final response = await constCtr.apis.addPlace(
      token: token,
      locationName: locationName,
      address: address,
      learningOpportunity: learningOpp,
      contactNo: phoneNumber,
      countryCode: '+91',
      websiteLink: website,
      description: 'sasasa',
      name: name,
      email: email,
    );

    _stopLoading();

    if (response != null) {
      submitAddPlaceDialog(
        constCtr.strings.thankYouForAddingLocation,
        () {
          Get.back();
        },
      );
    }

    clearFields();
  }

  clearFields() {
    locationNameCtr.clear();
    learningOppCtr.clear();
    websiteCtr.clear();
    addressCtr.clear();
    phoneNumberCtr.clear();
    nameCtr.clear();
    emailCtr.clear();
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
