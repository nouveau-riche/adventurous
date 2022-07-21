import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/screens/auth/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'The Adventurous Learner App',
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      home: const LoginScreen(),
    );
  }
}
