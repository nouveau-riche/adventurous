import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/data/controllers/add_place/add_place_controller.dart';
import 'package:adventurous_learner_app/screens/add_place/widget/address_textfield_widget.dart';
import 'package:adventurous_learner_app/screens/add_place/widget/contact_email_textfield_widget.dart';
import 'package:adventurous_learner_app/screens/add_place/widget/learning_opp_textfield_widget.dart';
import 'package:adventurous_learner_app/screens/add_place/widget/location_name_textfield_widget.dart';
import 'package:adventurous_learner_app/screens/add_place/widget/name_textfeild_widget.dart';
import 'package:adventurous_learner_app/screens/add_place/widget/phone_number_textfield_widget.dart';
import 'package:adventurous_learner_app/screens/add_place/widget/website_textfield_widget.dart';

class AddLocationFormParentWidget extends StatelessWidget {
  final bool isNotTabScreen;

  const AddLocationFormParentWidget({
    Key? key,
    this.isNotTabScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(AddPlaceController());

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 22, 0),
      child: Form(
        key: isNotTabScreen ? ctr.formKey2 : ctr.formKey,
        child: Column(
          children: const [
            SizedBox(height: 26),
            LocationNameTextFieldWidget(),
            SizedBox(height: 12),
            LearningOppTextFieldWidget(),
            SizedBox(height: 12),
            WebsiteTextFieldWidget(),
            SizedBox(height: 12),
            AddressTextFieldWidget(),
            SizedBox(height: 12),
            PhoneNumberTextFieldWidget(),
            SizedBox(height: 12),
            NameTextFieldWidget(),
            SizedBox(height: 12),
            ContactEmailTextFieldWidget(),
          ],
        ),
      ),
    );
  }
}
