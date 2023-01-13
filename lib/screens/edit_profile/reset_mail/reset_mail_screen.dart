import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';
import 'package:adventurous_learner_app/utils/widgets/rounded_elevated_bt_widget.dart';
import 'package:adventurous_learner_app/data/controllers/edit_profile/reset_email_controller.dart';
import 'package:adventurous_learner_app/screens/edit_profile/reset_mail/widget/reset_mail_textfield_widget.dart';

class ResetMailScreen extends StatelessWidget {
  const ResetMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(ResetMailController());

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
                        Assets.imagesPassword,
                        width: Get.width,
                        height: Get.height * 0.42,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Positioned(
                      top: 10,
                      child: BackButtonWidget(),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Text(
                  constCtr.strings.changeEmail,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  constCtr.strings.enterNewEmail,
                  style: const TextStyle(color: kSecondaryTextColor),
                ),
                const SizedBox(height: 20),
                Form(
                  key: ctr.formKey,
                  child: const ResetEmailFieldWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(35),
        child: GetBuilder<ResetMailController>(
          builder: (_) {
            if (ctr.isLoading) {
              return const CupertinoActivityIndicator();
            }

            return RoundedElevatedButtonWidget(
              text: Text(
                constCtr.strings.next,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              onPressed: () => ctr.generateOtp(),
              radius: 10,
            );
          },
        ),
      ),
    );
  }
}
