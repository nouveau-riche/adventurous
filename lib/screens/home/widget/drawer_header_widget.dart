import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/image_utils.dart';
import 'package:adventurous_learner_app/data/controllers/profile/profile_controller.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(ProfileController());

    return GetBuilder<ProfileController>(
      builder: (_) {
        return Container(
          height: 130,
          color: oliveColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                const SizedBox(width: 18),
                if ((ctr.userProfile?.imageUrl ?? 'Not Updated') ==
                    "Not Updated")
                  if (ctr.profileImage != null)
                    CircleAvatar(
                      backgroundColor: greyColor5,
                      radius: 35,
                      backgroundImage: FileImage(ctr.profileImage!),
                    )
                  else
                    const CircleAvatar(
                      backgroundColor: greyColor5,
                      radius: 35,
                    )
                else
                  Stack(
                    children: [
                      if (ctr.profileImage != null)
                        CircleAvatar(
                          backgroundColor: greyColor5,
                          radius: 35,
                          backgroundImage: FileImage(ctr.profileImage!),
                        )
                      else
                        circularProfileImage(
                          ctr.userProfile?.imageUrl ?? '',
                          35.0,
                        ),
                    ],
                  ),
                const SizedBox(width: 15),
                Text(
                  'Hi! ${ctr.userProfile?.name ?? ''}',
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
