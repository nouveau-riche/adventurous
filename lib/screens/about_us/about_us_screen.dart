import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: oliveColor,
        leading: const BackButtonWidget(color: Colors.white),
        title: const Text(
          'About Us',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            'Welcome to The Adventurous Learner\n\nWe are so excited to share our vision, passion, and commitment to fostering the best possible learning experience for your child.\nAt the Adventurous Learner, we are driven by our unwavering belief that every child is unique and deserves a learning approach that provides the freedom to effectively engage with the world around them. We feel that learning through experience is a vital part of our children’s education and can arguably be one of the most effective approaches for a young one’s mind.\n\nOur goal is to help parents unlock opportunities to maximize their child’s education by tapping into the possibilities of the world around them.\n\nThe Adventurous Learner was founded by full-time nomad and dad Coddie Gunseor. Their journey began with the desire to travel to all 50 states and 100 countries before his son turned 18.\n\nHowever, it evolved into so much more.\n\nCoddie quickly realized the amazing impact this lifestyle had on his young son’s eagerness to learn. From the way his son would comprehended new processes, or how he understood in depth the way things worked and why, was far greater than when he was teaching him via traditional methods.\n\nAs Coddie dove in he quickly found that there was lack of resources to help locate all the different learning opportunities around them. He founded The Adventurous Learner to help bridge the gap. The idea is that parents can have these resources at their fingertips and see a network of learning options available to them, no matter where they are. He wants all children to have the same opportunity as his son and never miss out on experiences that fuel their desire to learn.',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
