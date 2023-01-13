import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';
import 'package:adventurous_learner_app/data/controllers/auth/register_controller.dart';
import 'package:adventurous_learner_app/screens/auth/register/widget/register_bt_widget.dart';
import 'package:adventurous_learner_app/screens/auth/register/widget/already_have_account_bt_widget.dart';
import 'package:adventurous_learner_app/screens/auth/register/widget/register_name_field_widget.dart';
import 'package:adventurous_learner_app/screens/auth/register/widget/register_email_field_widget.dart';
import 'package:adventurous_learner_app/screens/auth/register/widget/register_password_field_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(RegisterController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                        fit: BoxFit.fill,
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
                  constCtr.strings.createProfile,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  constCtr.strings.fillProfileDetails,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: kSecondaryTextColor,
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: ctr.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      RegisterNameFieldWidget(),
                      SizedBox(height: 12),
                      RegisterEmailFieldWidget(),
                      SizedBox(height: 12),
                      RegisterPasswordFieldWidget(),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const RegisterBtWidget(),
                const SizedBox(height: 8),
                const AlreadyHaveAccountBtWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
