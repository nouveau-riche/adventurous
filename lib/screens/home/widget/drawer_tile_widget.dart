import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';

class DrawerTileWidget extends StatelessWidget {
  final String text;
  final String image;
  final Function() onPressed;

  const DrawerTileWidget({
    Key? key,
    required this.text,
    required this.image,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onPressed.call();
      },
      dense: true,
      minLeadingWidth: 10,
      leading: Image.asset(
        image,
        height: 20,
        color: oliveColor,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
