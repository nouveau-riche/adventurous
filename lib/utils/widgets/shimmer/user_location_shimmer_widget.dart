import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/widgets/shimmer/shimmer_widget.dart';

class UserLocationShimmerWidget extends StatelessWidget {
  const UserLocationShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 10,
        childAspectRatio: 0.67,
      ),
      itemBuilder: (_, index) {
        return const ShimmerWidget(radius: 12);
      },
      itemCount: 3,
    );
  }
}
