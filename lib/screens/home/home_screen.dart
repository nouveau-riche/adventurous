import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/widgets/notification_bt_widget.dart';
import 'package:adventurous_learner_app/screens/home/widget/drawer_widget.dart';
import 'package:adventurous_learner_app/data/controllers/home/home_controller.dart';
import 'package:adventurous_learner_app/utils/widgets/shimmer/home_screen_shimmmer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: oliveColor,
        title: Text(
          constCtr.strings.appName,
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
        actions: const [NotificationBtWidget()],
      ),
      drawer: const Drawer(child: DrawerWidget()),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<HomeController>(
            builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Image.asset(
                      Assets.logoAppIcon,
                      height: 122,
                    ),
                  ),
                  const SizedBox(height: 30),
                  if (ctr.isLoading)
                    const HomeScreenShimmerWidget()
                  else ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          const Text(
                            'Hi! ',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 19,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            ctr.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 19,
                              letterSpacing: 1,
                              color: oliveColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Html(
                        data: ctr.homeScreenContent?.description ?? '',
                        style: {
                          "body": Style(
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                          ),
                          "html": Style(textAlign: TextAlign.justify),
                        },
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
