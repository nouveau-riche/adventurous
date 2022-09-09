import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/data/controllers/add_visited_location/add_visited_location_controller.dart';

class SelectLocationNameFieldWidget extends StatelessWidget {
  const SelectLocationNameFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(AddVisitedLocationController());

    return GetBuilder<AddVisitedLocationController>(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: TextField(
            cursorColor: greenColor2,
            controller: ctr.locationNameCtr,
            decoration: InputDecoration(
              icon: Image.asset(
                Assets.iconsLearning,
                height: 20,
                width: 20,
                color: kTextFieldIconColor,
              ),
              hintText: 'Select Location Name',
              hintStyle: const TextStyle(
                color: kHintTextColor,
                fontWeight: FontWeight.w500,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor5, width: 1.4),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor5, width: 1.4),
              ),
            ),
            onChanged: (value) {
              if (value.length > 3) {
                ctr.fetchLocationForSearching(value);
              }
              ctr.updateSearchText(value);
            },
          ),
          // child: TypeAheadField(
          //   autoFlipDirection: true,
          //   textFieldConfiguration: TextFieldConfiguration(
          //     controller: ctr.locationNameCtr,
          //     textInputAction: TextInputAction.done,
          //     cursorColor: greenColor2,
          //     autocorrect: false,
          //     onChanged: (value) {
          //       ctr.fetchLocationForSearching(value);
          //     },
          //     decoration: InputDecoration(
          //       icon: Image.asset(
          //         Assets.iconsLearning,
          //         height: 20,
          //         width: 20,
          //         color: kTextFieldIconColor,
          //       ),
          //       hintText: 'Select Location Name',
          //       hintStyle: const TextStyle(
          //         color: kHintTextColor,
          //         fontWeight: FontWeight.w500,
          //       ),
          //       enabledBorder: const UnderlineInputBorder(
          //         borderSide: BorderSide(color: greyColor5, width: 1.4),
          //       ),
          //       focusedBorder: const UnderlineInputBorder(
          //         borderSide: BorderSide(color: greyColor5, width: 1.4),
          //       ),
          //     ),
          //   ),
          //   suggestionsCallback: (typedString) async {
          //     if (typedString.isNullOrEmpty) {
          //       return [null];
          //     }
          //
          //     return ctr.getLocationsSuggestion(typedString);
          //   },
          //   itemBuilder: (_, SearchedLocation? suggestion) {
          //
          //     return Container(
          //       height: 40,
          //       padding: const EdgeInsets.all(8),
          //       margin: const EdgeInsets.all(2),
          //       child: Text(
          //         suggestion?.name ?? '',
          //         style: const TextStyle(
          //           color: Colors.black,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //       // child: SubstringHighlight(
          //       //   text: suggestion?.name ?? '',
          //       //   term: ctr.locationNameCtr.text,
          //       //   textStyle: const TextStyle(color: Colors.black54),
          //       //   textStyleHighlight: const TextStyle(
          //       //     fontWeight: FontWeight.w600,
          //       //     color: Colors.black,
          //       //   ),
          //       // ),
          //     );
          //   },
          //   onSuggestionSelected: (SearchedLocation? suggestion) {
          //     ctr.onSuggestionSelected(suggestion);
          //   },
          //   noItemsFoundBuilder: (_) {
          //     return const Padding(
          //       padding: EdgeInsets.all(18),
          //       child: Text(
          //         'No location found!',
          //         style: TextStyle(
          //           fontSize: 16,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //     );
          //   },
          // ),
        );
      },
    );
  }
}
