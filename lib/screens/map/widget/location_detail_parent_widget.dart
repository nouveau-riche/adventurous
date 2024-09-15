import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/screens/map/widget/location_detail_widget.dart';
import 'package:adventurous_learner_app/data/controllers/map/location_detail_controller.dart';
import 'package:adventurous_learner_app/utils/widgets/shimmer/location_detail_shimmer_widget.dart';

class LocationDetailParentWidget extends StatelessWidget {
  const LocationDetailParentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(LocationDetailController());

    return GetBuilder<LocationDetailController>(
      builder: (_) {
        if (ctr.isLoading && ctr.locationDetails.isEmpty) {
          return const LocationDetailShimmerWidget();
        }

        return Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 134,
            child: ListView.builder(
              shrinkWrap: true,
              controller: ctr.scrollCtr,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
              itemBuilder: (_, index) => LocationDetailWidget(
                location: ctr.locationDetails[index],
                index: index,
              ),
              itemCount: ctr.locationDetails.length,
            ),
          ),
        );
      },
    );
  }
}
