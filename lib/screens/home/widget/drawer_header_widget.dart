import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      color: greenColor3,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          children: const [
            SizedBox(width: 18),
            CircleAvatar(radius: 35),
            SizedBox(width: 15),
            Text(
              'Hi! John',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
