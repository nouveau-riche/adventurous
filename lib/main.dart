import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/screens/splash/splash_screen.dart';
import 'package:adventurous_learner_app/utils/widgets/hide_keyboard_on_touch_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HideKeyboardOnTouchWidget(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: constCtr.strings.title,
        theme: ThemeData(
          textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
