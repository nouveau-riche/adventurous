import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/screens/splash/splash_screen.dart';
import 'package:adventurous_learner_app/utils/widgets/hide_keyboard_on_touch_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const oneSignalAppId = "98867326-2d6b-43f9-9273-f56ed00e5fb8";

  @override
  void initState() {
    initOneSignal();
    super.initState();
  }

  initOneSignal() async {
    OneSignal oneSignal = OneSignal.shared;

    oneSignal.setLogLevel(OSLogLevel.debug, OSLogLevel.none);
    oneSignal.setAppId(oneSignalAppId);

    oneSignal.promptUserForPushNotificationPermission().then((accepted) {
      printLog("Accepted permission: $accepted");
    });

    oneSignal.setNotificationOpenedHandler(
      (OSNotificationOpenedResult result) {},
    );

    oneSignal.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      event.complete(event.notification);
    });
  }

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
