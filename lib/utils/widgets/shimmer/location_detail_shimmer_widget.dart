import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/widgets/shimmer/shimmer_widget.dart';

class LocationDetailShimmerWidget extends StatelessWidget {
  const LocationDetailShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 134,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          itemBuilder: (_, index) {
            return Container(
              margin: const EdgeInsets.only(right: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ShimmerWidget(
                height: 85,
                width: 329,
                radius: 12,
              ),
            );
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
