import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:adventurous_learner_app/utils/image_utils.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/screens/place_detail/place_detail_screen.dart';
import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';

class LocationDetailWidget extends StatelessWidget {
  final LocationDetail? location;
  final int index;

  const LocationDetailWidget({
    Key? key,
    this.location,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => PlaceDetailScreen(
            location: location,
            index: index,
          ),
          transition: Transition.downToUp,
        );
      },
      child: Container(
        height: 85,
        width: 329,
        margin: const EdgeInsets.only(right: 14),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              color: kTextFieldIconColor,
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.55,
                  child: Text(
                    //maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    location?.name ?? '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      location?.rating?.toStringAsFixed(1).toString() ?? '',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    RatingBarIndicator(
                      unratedColor: yellowColor,
                      rating: location?.rating?.toDouble() ?? 0.0,
                      itemBuilder: (_, index) {
                        if (index < (location?.rating?.toInt() ?? 0)) {
                          return const Icon(
                            Icons.star,
                            color: yellowColor,
                          );
                        }

                        return const Icon(
                          Icons.star_border,
                          color: yellowColor,
                        );
                      },
                      itemCount: 5,
                      itemSize: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '(${location?.ratingCount?.toString() ?? ''})',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    location?.address ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: kHintTextColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            getImageBuilder(
              ((location?.attachment ?? []).isNotEmpty)
                  ? (location?.attachment?[0].filePath)
                  : '',
              BorderRadius.circular(10),
              height: 57,
              width: 68,
              fit: BoxFit.fill,
              placeHolder: placeHolderImage(
                57,
                68,
                BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
