import 'package:adventurous_learner_app/data/controllers/auth/logout_controller.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/widgets/rounded_elevated_bt_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: RoundedElevatedButtonWidget(
            text: Text('Logout'),
            onPressed: () {
              Get.put(LogoutController()).logoutUser();
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: greenColor1),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: greenColor1),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: greenColor1),
            label: 'Add Place',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: greenColor1),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
