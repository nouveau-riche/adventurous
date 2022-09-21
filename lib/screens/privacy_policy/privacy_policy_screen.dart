import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';

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
      body: const SingleChildScrollView(
        physics:  BouncingScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id lobortis enim, sit ullamcorper viverra. Integer euismod magna nec, varius pretium morbi. NuncLorem ipsum dolor sit amet, consectetur adipiscing elit. Id lobortis enim, sit ullamcorper viverra. Integer euismod magna nec, varius pretium morbi. Nunc \n \nLorem ipsum dolor sit amet, consectetur adipiscing elit. Id lobortis enim, sit ullamcorper viverra. Integer euismod magna nec, varius pretium morbi. NuncLorem ipsum dolor sit amet, consectetur adipiscing elit. Id lobortis enim, sit ullamcorper viverra. Integer euismod magna nec, varius pretium morbi. Nunc  ',
          ),
        ),
      ),
    );
  }
}
