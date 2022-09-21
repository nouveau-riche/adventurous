import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';
import 'package:adventurous_learner_app/screens/learning_module/widget/module_widget.dart';
import 'package:adventurous_learner_app/utils/widgets/shimmer/learning_module_shimmer_widget.dart';
import 'package:adventurous_learner_app/data/controllers/learning_modules/learning_module_controller.dart';

class LearningModulesScreen extends StatelessWidget {
  const LearningModulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(LearningModuleController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: oliveColor,
        leading: const BackButtonWidget(color: Colors.white),
        title: const Text(
          'Learning Modules',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: GetBuilder<LearningModuleController>(
        builder: (_) {
          if (ctr.isLoading && ctr.modules.isEmpty) {
            return const LearningModuleShimmerWidget();
          }

          if (ctr.modules.isEmpty) {
            return const Center(
              child: Text(
                'No Modules found',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) {
              return LearningModuleWidget(module: ctr.modules[index]);
            },
            itemCount: ctr.modules.length,
            shrinkWrap: true,
          );
        },
      ),
    );
  }
}
