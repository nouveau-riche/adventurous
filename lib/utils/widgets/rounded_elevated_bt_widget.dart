import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';

class RoundedElevatedButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final Widget text;
  final Function onPressed;
  final double radius;
  final double elevation;

  const RoundedElevatedButtonWidget({
    Key? key,
    this.height = 45,
    this.width = 310,
    required this.text,
    required this.onPressed,
    this.radius = 0,
    this.elevation = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 5,
          )
        ],
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [greenColor1, greenColor2],
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(elevation),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () => onPressed(),
        child: text,
      ),
    );
  }
}
