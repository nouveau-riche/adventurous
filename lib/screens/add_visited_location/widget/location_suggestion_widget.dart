import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/data/controllers/add_visited_location/add_visited_location_controller.dart';
import 'package:adventurous_learner_app/data/modals/add_visited_location/search_location_response.dart';

class LocationSuggestionWidget extends StatelessWidget {
  const LocationSuggestionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(AddVisitedLocationController());

    return GetBuilder<AddVisitedLocationController>(
      builder: (_) {
        List<SearchedLocation?> locations =
            ctr.getLocationsSuggestion(ctr.locationNameCtr.text);

        if (ctr.searchText.length > 3 && locations.isNotEmpty) {
          return Positioned(
            bottom: 0,
            child: Card(
              margin: const EdgeInsets.only(left: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.grey[200],
                ),
                width: Get.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: locations
                      .map(
                        (e) => GestureDetector(
                          onTap: () => ctr.onSuggestionSelected(e),
                          child: Container(
                            height: 40,
                            width: Get.width * 0.5,
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(2),
                            child: Text(
                              e?.name ?? '',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
