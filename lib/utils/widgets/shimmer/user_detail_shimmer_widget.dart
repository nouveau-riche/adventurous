import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/widgets/shimmer/shimmer_widget.dart';

class UserDetailShimmerWidget extends StatelessWidget {
  const UserDetailShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ShimmerWidget(height: 90, width: 90, radius: 100),
        SizedBox(height: 8),
        ShimmerWidget(height: 12, width: 80, radius: 4),
        SizedBox(height: 14),
        ShimmerWidget(height: 12, width: 120, radius: 4),
        SizedBox(height: 14),
      ],
    );
  }
}
