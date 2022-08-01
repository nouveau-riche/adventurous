import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Get.back(),
      splashColor: Colors.transparent,
      icon: const Icon(Icons.arrow_back_ios, size: 22),
    );
  }
}
