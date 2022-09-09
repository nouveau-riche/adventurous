import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/screens/profile/widget/your_total_location_widget.dart';
import 'package:adventurous_learner_app/utils/widgets/shimmer/user_location_shimmer_widget.dart';
import 'package:adventurous_learner_app/screens/profile/widget/place_detail_vertical_widget.dart';
import 'package:adventurous_learner_app/data/controllers/profile/user_visited_location_controller.dart';

class VisitedLocationParentWidget extends StatelessWidget {
  const VisitedLocationParentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(UserVisitedLocationController());

    return GetBuilder<UserVisitedLocationController>(
      builder: (_) {
        if (ctr.isLoading && ctr.locations.isEmpty) {
          return const UserLocationShimmerWidget();
        }

        if (ctr.locations.isEmpty) {
          return const Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              "You don't have any visited\nlocation yet",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }

        return Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 10,
                childAspectRatio: 0.67,
              ),
              itemBuilder: (_, index) {
                return PlaceDetailVerticalWidget(
                  index: index,
                  location: ctr.locations[index],
                );
              },
              itemCount: min(ctr.locations.length, 4),
            ),
            if (ctr.locations.length > 4) ...[
              const SizedBox(height: 30),
              YourTotalLocationWidget(totalLocation: ctr.locations.length),
            ],
            const SizedBox(height: 50),
          ],
        );
      },
    );
  }
}
