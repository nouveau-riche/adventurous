import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/widgets/shimmer/shimmer_widget.dart';

class LearningModuleShimmerWidget extends StatelessWidget {
  const LearningModuleShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (_, __) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: const ShimmerWidget(height: 60, radius: 12),
        );
      },
      itemCount: 6,
    );
  }
}
