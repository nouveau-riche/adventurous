import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final Color color;

  const BackButtonWidget({
    Key? key,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Get.back(),
      splashColor: Colors.transparent,
      icon: Icon(Icons.arrow_back_ios, size: 22, color: color),
    );
  }
}
