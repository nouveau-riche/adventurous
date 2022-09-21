import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';
import 'package:adventurous_learner_app/utils/widgets/rounded_elevated_bt_widget.dart';
import 'package:adventurous_learner_app/data/controllers/auth/reset_password_controller.dart';
import 'package:adventurous_learner_app/screens/auth/reset_password/widget/forgot_passord_email_field_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final bool isResettingFromInside;

  const ForgotPasswordScreen({
    Key? key,
    this.isResettingFromInside = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(ResetPasswordController());

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
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 30,
                        right: 30,
                      ),
                      child: Image.asset(
                        Assets.imagesPassword,
                        width: Get.width,
                        height: Get.height * 0.42,
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
                  isResettingFromInside
                      ? constCtr.strings.changePassword
                      : constCtr.strings.forgotPassword,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  constCtr.strings.enterEmailAtTimeOfCreatingAccount,
                  style: const TextStyle(color: kSecondaryTextColor),
                ),
                const SizedBox(height: 20),
                Form(
                  key: ctr.formKey,
                  child: const ForgotPasswordEmailFieldWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(35),
        child: GetBuilder<ResetPasswordController>(
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
              onPressed: () => ctr.generateOtp(isResettingFromInside),
              radius: 10,
            );
          },
        ),
      ),
    );
  }
}
