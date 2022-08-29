import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/widgets/shimmer/shimmer_widget.dart';

class HomeScreenShimmerWidget extends StatelessWidget {
  const HomeScreenShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ShimmerWidget(height: 14, width: 100, radius: 4),
        SizedBox(height: 16),
        ShimmerWidget(height: 10, width: 340, radius: 4),
        SizedBox(height: 4),
        ShimmerWidget(height: 10, width: 310, radius: 4),
        SizedBox(height: 4),
        ShimmerWidget(height: 10, width: 330, radius: 4),
        SizedBox(height: 4),
        ShimmerWidget(height: 10, width: 330, radius: 4),
        SizedBox(height: 4),
        ShimmerWidget(height: 10, width: 300, radius: 4),
        SizedBox(height: 20),
        ShimmerWidget(height: 10, width: 340, radius: 4),
        SizedBox(height: 4),
        ShimmerWidget(height: 10, width: 310, radius: 4),
        SizedBox(height: 4),
        ShimmerWidget(height: 10, width: 330, radius: 4),
        SizedBox(height: 4),
        ShimmerWidget(height: 10, width: 330, radius: 4),
        SizedBox(height: 4),
        ShimmerWidget(height: 10, width: 300, radius: 4),
      ],
    );
  }
}
