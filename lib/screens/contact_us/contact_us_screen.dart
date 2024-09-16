import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';
import 'package:adventurous_learner_app/utils/widgets/rounded_elevated_bt_widget.dart';
import 'package:adventurous_learner_app/utils/widgets/shimmer/contact_us_shimmer_widget.dart';
import 'package:adventurous_learner_app/data/controllers/contact_us/contact_us_controller.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(ContactUsController());

    return GetBuilder<ContactUsController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: oliveColor,
            leading: const BackButtonWidget(color: Colors.white),
            title: const Text(
              'Contact Us',
              style: TextStyle(color: Colors.white),
            ),
            elevation: 0,
            centerTitle: true,
          ),
          body: ctr.details == null
              ? const ContactUsShimmerWidget()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Image.network(
                        ctr.details?.imageURL ?? "",
                        height: 300,
                        width: Get.width,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 18),
                       Text(
                        ctr.details?.email ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 40),
                      RoundedElevatedButtonWidget(
                        height: 42,
                        width: 156,
                        radius: 10,
                        elevation: 0,
                        text: const Text(
                          'Email Us',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () => openMail(ctr.details?.email ?? ''),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
