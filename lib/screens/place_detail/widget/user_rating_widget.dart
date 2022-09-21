import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';
import 'package:adventurous_learner_app/screens/place_detail/widget/place_images_list.dart';

class UserRatingWidget extends StatelessWidget {
  final Reviews? reviews;

  const UserRatingWidget({
    Key? key,
    this.reviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                height: 21,
                width: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: oliveColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  reviews?.rating?.toStringAsFixed(1).toString() ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.2,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Text(
                reviews?.createdByName ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ReadMoreText(
            reviews?.text ?? '',
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'more',
            trimExpandedText: 'less',
            moreStyle: const TextStyle(
              color: oliveColor,
              fontWeight: FontWeight.bold,
            ),
            lessStyle: const TextStyle(
              color: oliveColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          if ((reviews?.attachment ?? []).isNotEmpty) ...[
            PlaceImagesWidget(
              height: 60,
              width: 60,
              images: reviews?.attachment ?? [],
            ),
            const SizedBox(height: 14),
          ],
        ],
      ),
    );
  }
}
