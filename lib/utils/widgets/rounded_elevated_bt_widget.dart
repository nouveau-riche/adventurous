import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';

class RoundedElevatedButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final Widget text;
  final Function onPressed;
  final double radius;
  final double elevation;
  final Color? color;

  const RoundedElevatedButtonWidget({
    Key? key,
    this.height = 45,
    this.width = 310,
    required this.text,
    required this.onPressed,
    this.radius = 0,
    this.elevation = 2,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: oliveColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          backgroundColor: Colors.transparent,
          elevation: elevation,
          shadowColor: Colors.transparent,
        ),
        onPressed: () => onPressed(),
        child: text,
      ),
    );
  }
}
