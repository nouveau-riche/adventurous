import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/screens/auth/reset_password/forgot_password_screen.dart';
import 'package:adventurous_learner_app/screens/edit_profile/reset_mail/reset_mail_screen.dart';
import 'package:adventurous_learner_app/screens/edit_profile/name_and_bio/name_and_bio_screen.dart';

editProfileBottomSheet() {
  Get.bottomSheet(
    SafeArea(
      child: SizedBox(
        height: Get.height * 0.42,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'Edit profile',
                style: TextStyle(
                  fontSize: 15,
                  color: kHintTextColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 26),
              ListTile(
                onTap: () {
                  Get.back();
                  Get.to(
                    () => const NameAndBioScreen(),
                    transition: Transition.downToUp,
                  );
                },
                leading: Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: greyColor7,
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    Assets.iconsName,
                    height: 16,
                    width: 16,
                    color: kHintTextColor,
                  ),
                ),
                title: const Text(
                  'Name or Bio',
                  style: TextStyle(
                    color: kHintTextColor,
                    fontSize: 14.6,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: kHintTextColor,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.back();
                  Get.to(
                    () => const ResetMailScreen(),
                    transition: Transition.downToUp,
                  );
                },
                leading: Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: greyColor7,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.alternate_email_outlined,
                    size: 16,
                    color: kHintTextColor,
                  ),
                ),
                title: const Text(
                  'Email',
                  style: TextStyle(
                    color: kHintTextColor,
                    fontSize: 14.6,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: kHintTextColor,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.back();
                  Get.to(
                    () => const ForgotPasswordScreen(
                      isResettingFromInside: true,
                    ),
                    transition: Transition.downToUp,
                  );
                },
                leading: Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: greyColor7,
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    Assets.iconsPassword,
                    height: 16,
                    width: 16,
                    color: kHintTextColor,
                  ),
                ),
                title: const Text(
                  'Password',
                  style: TextStyle(
                    color: kHintTextColor,
                    fontSize: 14.6,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: kHintTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(16),
        topLeft: Radius.circular(16),
      ),
    ),
  );
}
