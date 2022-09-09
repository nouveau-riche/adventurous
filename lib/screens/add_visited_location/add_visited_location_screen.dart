import 'package:adventurous_learner_app/screens/add_visited_location/widget/location_suggestion_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';
import 'package:adventurous_learner_app/screens/add_visited_location/widget/didnt_find_location_widget.dart';
import 'package:adventurous_learner_app/screens/add_visited_location/widget/visited_location_address_widget.dart';
import 'package:adventurous_learner_app/screens/add_visited_location/widget/select_location_name_field_widget.dart';
import 'package:adventurous_learner_app/screens/add_visited_location/widget/save_vistited_location_bt_widget.dart';

class AddVisitedLocationScreen extends StatelessWidget {
  const AddVisitedLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor3,
        leading: const BackButtonWidget(color: Colors.white),
        title: const Text(
          'New Visited Location',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    Assets.imagesVisitedLocation,
                    width: Get.width,
                    height: Get.height * 0.42,
                    fit: BoxFit.fill,
                  ),
                  const LocationSuggestionWidget(),
                ],
              ),
              const SizedBox(height: 16),
              const SelectLocationNameFieldWidget(),
              const SizedBox(height: 12),
              const VisitedLocationAddressWidget(),
              const SizedBox(height: 20),
              const DidntFindLocationWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const SaveVisitedLocationBtWidget(),
    );
  }
}
