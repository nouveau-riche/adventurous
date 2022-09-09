import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/image_utils.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/screens/place_detail/place_detail_screen.dart';
import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';

class PlaceDetailVerticalWidget extends StatelessWidget {
  final LocationDetail? location;
  final int index;

  const PlaceDetailVerticalWidget({
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
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: 176,
          height: 252,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: ((location?.attachment ?? []).isNotEmpty)
                      ? ('https://adventurelearner.herokuapp.com/api/v1/app/read-file${location?.attachment?[0].filePath}')
                      : '',
                  height: 252,
                  width: 176,
                  httpHeaders: {
                    'x-access-token': constCtr.token,
                  },
                  imageBuilder: (_, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  placeholder: (_, __) => placeHolderImage(
                    252,
                    176,
                    const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  errorWidget: (_, __, ___) => placeHolderImage(
                    252,
                    176,
                    const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  location?.name ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  location?.address ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12.5,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RatingBarIndicator(
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
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }
}
