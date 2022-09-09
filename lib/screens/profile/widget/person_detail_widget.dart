import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/image_utils.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/data/controllers/profile/profile_controller.dart';
import 'package:adventurous_learner_app/utils/widgets/shimmer/user_detail_shimmer_widget.dart';

class PersonalDetailWidget extends StatelessWidget {
  const PersonalDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(ProfileController());

    return GetBuilder<ProfileController>(
      builder: (_) {
        if (ctr.isLoading && ctr.userProfile == null) {
          return const UserDetailShimmerWidget();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              if ((ctr.userProfile?.imageUrl ?? 'Not Updated') == "Not Updated")
                Stack(
                  children: [
                    if (ctr.profileImage != null)
                      CircleAvatar(
                        backgroundColor: greyColor5,
                        radius: 45,
                        backgroundImage: FileImage(ctr.profileImage!),
                      )
                    else
                      const CircleAvatar(
                        backgroundColor: greyColor5,
                        radius: 45,
                      ),
                    Positioned(
                      bottom: 2,
                      right: 2,
                      child: CircleAvatar(
                        backgroundColor: greenColor3,
                        radius: 12,
                        child: IconButton(
                          padding: const EdgeInsets.all(4),
                          constraints: const BoxConstraints(),
                          onPressed: () => ctr.updateImage(),
                          icon: const Icon(
                            Icons.edit,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              else
                Stack(
                  children: [
                    if (ctr.profileImage != null)
                      CircleAvatar(
                        backgroundColor: greyColor5,
                        radius: 45,
                        backgroundImage: FileImage(ctr.profileImage!),
                      )
                    else
                      circularProfileImage(
                        ctr.userProfile?.imageUrl ?? '',
                        45,
                      ),
                    Positioned(
                      bottom: 2,
                      right: 2,
                      child: CircleAvatar(
                        backgroundColor: greenColor3,
                        radius: 12,
                        child: IconButton(
                          padding: const EdgeInsets.all(4),
                          constraints: const BoxConstraints(),
                          onPressed: () => ctr.updateImage(),
                          icon: const Icon(
                            Icons.edit,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 8),
              Text(
                ctr.userProfile?.name ?? '',
                style: const TextStyle(
                  fontSize: 22,
                  letterSpacing: 0.9,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                ctr.userProfile?.address ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  color: greyColor6,
                  letterSpacing: 0.9,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 18),
              Text(ctr.userProfile?.bio ?? ''),
            ],
          ),
        );
      },
    );
  }
}
