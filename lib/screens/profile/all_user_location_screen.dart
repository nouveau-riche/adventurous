import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';
import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';
import 'package:adventurous_learner_app/screens/place_detail/place_detail_screen.dart';
import 'package:adventurous_learner_app/screens/profile/widget/place_detail_vertical_widget.dart';
import 'package:adventurous_learner_app/data/controllers/profile/user_visited_location_controller.dart';

class AllUserLocationScreen extends StatelessWidget {
  const AllUserLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(UserVisitedLocationController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: oliveColor,
        leading: const BackButtonWidget(color: Colors.white),
        title: const Text(
          'Visited Location',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                height: 38,
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(14, 0, 8, 0),
                      hintText: 'Search Here...',
                      hintStyle: const TextStyle(
                        color: kSecondaryTextColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: greyColor3,
                          width: 0.7,
                        ),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: greyColor3,
                          width: 0.7,
                        ),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          Assets.iconsSearch,
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                    cursorColor: oliveColor,
                    controller: ctr.searchCtr,
                  ),
                  suggestionsCallback: (pattern) {
                    return ctr.locations.where((LocationDetail option) {
                      return option.name!
                          .toLowerCase()
                          .contains(pattern.toLowerCase());
                    });
                  },
                  itemBuilder: (_, LocationDetail? suggestion) {
                    return ListTile(
                      contentPadding: const EdgeInsets.only(left: 12),
                      title: Text(
                        suggestion?.name ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                  onSuggestionSelected: (LocationDetail? suggestion) {
                    int index = ctr.getLocationIndex(
                      suggestion?.locationId ?? '',
                    );

                    Get.to(
                      () => PlaceDetailScreen(
                        location: suggestion,
                        index: index,
                      ),
                      transition: Transition.downToUp,
                    );

                    ctr.searchCtr.clear();
                  },
                  suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
              itemCount: ctr.locations.length,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
