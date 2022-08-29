import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';
import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';
import 'package:adventurous_learner_app/utils/widgets/rounded_elevated_bt_widget.dart';
import 'package:adventurous_learner_app/screens/place_detail/widget/add_review_widget.dart';
import 'package:adventurous_learner_app/screens/place_detail/widget/place_images_list.dart';
import 'package:adventurous_learner_app/screens/place_detail/widget/user_rating_widget.dart';

class PlaceDetailScreen extends StatelessWidget {
  final LocationDetail? location;
  final int index;

  const PlaceDetailScreen({
    Key? key,
    this.location,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor3,
        leading: const BackButtonWidget(color: Colors.white),
        title: Text(
          location?.name ?? '',
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    location?.rating?.toStringAsFixed(1).toString() ?? '',
                    style: const TextStyle(color: kHintTextColor),
                  ),
                  const SizedBox(width: 8),
                  RatingBarIndicator(
                    unratedColor: Colors.black,
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
                        color: Colors.black,
                      );
                    },
                    itemCount: 5,
                    itemSize: 20,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '(${location?.ratingCount?.toString() ?? ''})',
                    style: const TextStyle(color: kHintTextColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                location?.address ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  color: kHintTextColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedElevatedButtonWidget(
                    height: 30,
                    width: 100,
                    radius: 32,
                    elevation: 0,
                    color: greenColor3,
                    text: Text(constCtr.strings.direction),
                    onPressed: () {
                      openURL(
                        'https://www.google.com/maps/search/?api=1&query=${location?.location?.coordinates?[1] ?? ''},${location?.location?.coordinates?[0] ?? ''}',
                      );
                    },
                  ),
                  RoundedElevatedButtonWidget(
                    height: 30,
                    width: 100,
                    radius: 32,
                    elevation: 0,
                    color: greenColor3,
                    text: Text(constCtr.strings.contact),
                    onPressed: () {
                      openURL(
                        'tel:${location?.countryCode ?? '+91'}${location?.contactNo ?? ''}',
                      );
                    },
                  ),
                  RoundedElevatedButtonWidget(
                    height: 30,
                    width: 100,
                    radius: 32,
                    elevation: 0,
                    color: greenColor3,
                    text: Text(constCtr.strings.website),
                    onPressed: () {
                      openURL(location?.websiteLink ?? '');
                    },
                  ),
                ],
              ),
            ),
            if ((location?.attachment ?? []).isNotEmpty) ...[
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PlaceImagesWidget(
                  height: 220,
                  width: 247,
                  images: location?.attachment ?? [],
                ),
              ),
            ],
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(location?.description ?? ''),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                constCtr.strings.learningOpportunity,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(location?.learningOpportunity ?? ''),
            ),
            const SizedBox(height: 8),
            AddReviewWidget(
              placeName: location?.name ?? '',
              location: location,
              index: index,
              reviewAdd: location?.reviewAdd ?? false,
            ),
            if ((location?.reviewImages ?? []).isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PlaceImagesWidget(
                  height: 60,
                  width: 60,
                  images: location?.reviewImages ?? [],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Divider(color: greyColor4, thickness: 1),
              ),
            ],
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, index) {
                return const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Divider(color: greyColor4, thickness: 1),
                );
              },
              itemBuilder: (_, index) {
                return UserRatingWidget(reviews: location?.reviews?[index]);
              },
              itemCount: location?.reviews?.length ?? 0,
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
