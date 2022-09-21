import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/widgets/shimmer/shimmer_widget.dart';

class ContactUsShimmerWidget extends StatelessWidget {
  const ContactUsShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          ShimmerWidget(height: 300, width: Get.width),
          const SizedBox(height: 18),
          ShimmerWidget(height: 14, width: Get.width * 0.75, radius: 6),
          const SizedBox(height: 10),
          ShimmerWidget(height: 14, width: Get.width * 0.4, radius: 6),
          const SizedBox(height: 40),
          const ShimmerWidget(height: 42, width: 156, radius: 10),
        ],
      ),
    );
  }
}
