import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final double radius;

  const ShimmerWidget({
    Key? key,
    this.height = 0,
    this.width = 0,
    this.radius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: greyColor2,
      highlightColor: greyColor1,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
