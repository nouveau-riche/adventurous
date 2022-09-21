import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/screens/learning_module/view_pdf_screen.dart';
import 'package:adventurous_learner_app/data/modals/learning_module/learning_module_response.dart';

class LearningModuleWidget extends StatelessWidget {
  final Module module;

  const LearningModuleWidget({
    Key? key,
    required this.module,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ViewPdfScreen(url: '$readPdfBaseUrl${module.path}'),
          transition: Transition.downToUp,
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                color: Colors.grey.shade300,
                blurRadius: 2,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 38,
                width: 38,
                decoration: const BoxDecoration(
                  color: oliveColor,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(7.5),
                child: Image.asset(Assets.iconsModule),
              ),
              const SizedBox(width: 16),
              Text(
                module.title ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: oliveColor,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
