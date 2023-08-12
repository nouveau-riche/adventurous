import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/screens/place_detail/place_detail_screen.dart';
import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';
import 'package:adventurous_learner_app/data/controllers/map/location_detail_controller.dart';

import '../../filter_screen/Filter_screen.dart';

class SearchAndFilterLocationWidget extends StatelessWidget {
   SearchAndFilterLocationWidget({Key? key,required this.isFilter}) : super(key: key);
    RxBool isFilter;
   @override
   Widget build(BuildContext context) {
    final ctr = Get.put(LocationDetailController());

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 38,
                    child: TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(14, 0, 8, 0),
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
                      ),
                      suggestionsCallback: (pattern) {
                        return ctr.locationDetails
                            .where((LocationDetail option) {
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
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(() => FilterScreen(isFilter: isFilter));
                  },
                  child: Container(
                      height: 38,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(32),
                          color: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Filters",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 17),
                            ),
                            Image(
                              image: AssetImage(Assets.filterScreen),
                              height: 30,
                              width: 30,
                            )
                          ],
                        ),
                      )),
                ))
              ],
            )),
      ),
    );
  }
}
