import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/image_utils.dart';
import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';
import 'package:adventurous_learner_app/screens/place_detail/widget/image_full_screen.dart';

class PlaceImagesWidget extends StatelessWidget {
  final double height;
  final double width;
  final List<Attachment> images;

  const PlaceImagesWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: height,
      child: FutureBuilder<String?>(
        future: constCtr.prefRepo.getUserXAccessToken(),
        initialData: '',
        builder: (_, snapshot) {
          if (snapshot.data == null) {
            return const SizedBox();
          }

          return Align(
            alignment: Alignment.centerLeft,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    Get.to(
                      () => ImageFullScreen(
                        imagePath: images[index].filePath ?? '',
                      ),
                      transition: Transition.downToUp,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 14),
                    child: getImageBuilder(
                      'https://adventurelearner.herokuapp.com/api/v1/app/read-file${images[index].filePath}',
                      snapshot.data ?? '',
                      BorderRadius.circular(12),
                      height: height,
                      width: width,
                      fit: BoxFit.fill,
                      placeHolder: placeHolderImage(
                        height,
                        width,
                        BorderRadius.circular(12),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
