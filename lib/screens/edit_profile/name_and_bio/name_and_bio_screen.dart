import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';
import 'package:adventurous_learner_app/utils/widgets/rounded_elevated_bt_widget.dart';
import 'package:adventurous_learner_app/screens/edit_profile/name_and_bio/widget/edit_bio_textfield_widget.dart';
import 'package:adventurous_learner_app/screens/edit_profile/name_and_bio/widget/edit_location_textfield_widget.dart';
import 'package:adventurous_learner_app/screens/edit_profile/name_and_bio/widget/edit_name_textfield_widget.dart';
import 'package:adventurous_learner_app/data/controllers/edit_profile/edit_name_and_bio_controller.dart';

class NameAndBioScreen extends StatelessWidget {
  const NameAndBioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(EditNameAndBioController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      child: Image.asset(
                        Assets.imagesLogin,
                        width: Get.width,
                        height: Get.height * 0.41,
                      ),
                    ),
                    const Positioned(
                      top: 10,
                      child: BackButtonWidget(),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.01),
                Text(
                  constCtr.strings.changeNameOrBio,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 16),
                Form(
                  key: ctr.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      EditNameTextFieldWidget(),
                      SizedBox(height: 24),
                      EditBioTextFieldWidget(),
                      SizedBox(height: 12),
                      EditLocationTextFieldWidget(),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(35),
        child: GetBuilder<EditNameAndBioController>(
          builder: (_) {
            if (ctr.isLoading) {
              return const CupertinoActivityIndicator();
            }

            return RoundedElevatedButtonWidget(
              text: Text(
                constCtr.strings.save,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              onPressed: () => ctr.updateNameAndBio(),
              radius: 10,
            );
          },
        ),
      ),
    );
  }
}
