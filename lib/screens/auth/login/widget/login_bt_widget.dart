import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/controllers/auth/login_controller.dart';
import 'package:adventurous_learner_app/utils/widgets/rounded_elevated_bt_widget.dart';

class LoginBtWidget extends StatelessWidget {
  const LoginBtWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(LoginController());

    return Center(
      child: GetBuilder<LoginController>(
        builder: (_) {
          if (ctr.isLoading) {
            return const CupertinoActivityIndicator();
          }

          return RoundedElevatedButtonWidget(
            text: Text(
              constCtr.strings.submit,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onPressed: () => ctr.loginUser,
            radius: 10,
          );
        },
      ),
    );
  }
}
