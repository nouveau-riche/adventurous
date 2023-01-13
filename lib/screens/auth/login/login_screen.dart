import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/data/controllers/auth/login_controller.dart';
import 'package:adventurous_learner_app/screens/auth/login/widget/login_bt_widget.dart';
import 'package:adventurous_learner_app/screens/auth/register/register_screen.dart';
import 'package:adventurous_learner_app/utils/widgets/rounded_elevated_bt_widget.dart';
import 'package:adventurous_learner_app/screens/auth/login/widget/login_email_field_widget.dart';
import 'package:adventurous_learner_app/screens/auth/login/widget/login_password_field_widget.dart';
import 'package:adventurous_learner_app/screens/auth/login/widget/forgot_password_bt_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(LoginController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: Get.height * 0.01),
                Text(
                  constCtr.strings.login,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  constCtr.strings.seeYouAgain,
                  style: const TextStyle(color: kSecondaryTextColor),
                ),
                const SizedBox(height: 20),
                Form(
                  key: ctr.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      LoginEmailFieldWidget(),
                      SizedBox(height: 12),
                      LoginPasswordFieldWidget(),
                    ],
                  ),
                ),
                const ForgotPasswordBtWidget(),
                const SizedBox(height: 10),
                const LoginBtWidget(),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 0.5,
                      color: kTextFieldIconColor,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      constCtr.strings.or,
                      style: const TextStyle(
                        color: kHintTextColor,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 120,
                      height: 0.5,
                      color: kTextFieldIconColor,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Center(
                  child: RoundedElevatedButtonWidget(
                    text: Text(
                      constCtr.strings.createNewProfile,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      Get.to(
                        () => const RegisterScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                    radius: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
