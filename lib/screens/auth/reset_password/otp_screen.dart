import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:adventurous_learner_app/utils/extensions.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';
import 'package:adventurous_learner_app/utils/widgets/rounded_elevated_bt_widget.dart';
import 'package:adventurous_learner_app/data/controllers/auth/reset_password_controller.dart';

class OtpScreen extends StatelessWidget {
  final bool isResetPassword;

  const OtpScreen({Key? key, this.isResetPassword = false}) : super(key: key);

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
                    Image.asset(
                      Assets.imagesEnterOtp,
                      width: Get.width,
                      height: Get.height * 0.42,
                    ),
                    const Positioned(
                      top: 10,
                      child: BackButtonWidget(),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Text(
                  constCtr.strings.enterOTP,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  constCtr.strings.sixDigitOtp,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: kSecondaryTextColor,
                  ),
                ),
                const SizedBox(height: 30),
                Form(
                  key: ctr.otpFormKey,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 6,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      textStyle: const TextStyle(color: Colors.black),
                      animationType: AnimationType.fade,
                      cursorColor: greenColor1,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(1),
                        fieldHeight: 40,
                        fieldWidth: 40,
                        borderWidth: 1.2,
                        activeFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        selectedColor: greenColor1,
                        inactiveColor: Colors.black,
                        activeColor: greenColor1,
                      ),
                      errorTextMargin: const EdgeInsets.only(top: 38),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.white24,
                      enableActiveFill: true,
                      controller: ctr.pinCtr,
                      onCompleted: (pin) async {},
                      onChanged: (_) {},
                      validator: (value) {
                        if (value.isNullOrEmpty || (value ?? '').length != 6) {
                          return 'Enter 6 digit OTP';
                        }
                      },
                      onSaved: (value) {
                        ctr.enteredOtp = value ?? '';
                      },
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                  ),
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
              onPressed: () {
                ctr.verifyPin(isResetPassword: isResetPassword);
              },
              radius: 10,
            );
          },
        ),
      ),
    );
  }
}
