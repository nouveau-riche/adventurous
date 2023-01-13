import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: oliveColor,
        leading: const BackButtonWidget(color: Colors.white),
        title: const Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: const PDF().fromAsset(
        'assets/doc/privacy_policy.pdf',
        loadingWidget: () => const Center(child: CircularProgressIndicator()),
        errorWidget: (error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
