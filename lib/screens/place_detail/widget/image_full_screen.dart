import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/image_utils.dart';
import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';

class ImageFullScreen extends StatelessWidget {
  final int initialIndex;
  final List<Attachment> images;

  const ImageFullScreen({
    Key? key,
    required this.initialIndex,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: initialIndex);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            splashColor: Colors.transparent,
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: PageView.builder(
        itemBuilder: (_, index) {
          return getImageBuilder(
            images[index].filePath ?? '',
            BorderRadius.circular(0),
            fit: BoxFit.contain,
            height: Get.height,
            width: Get.width,
            placeHolder: placeHolderImage(
              Get.height,
              Get.width,
              BorderRadius.circular(0),
            ),
          );
        },
        controller: controller,
        itemCount: images.length,
      ),
    );
  }
}
