import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/image_utils.dart';

class ImageFullScreen extends StatelessWidget {
  final String imagePath;

  const ImageFullScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder<String?>(
          future: constCtr.prefRepo.getUserXAccessToken(),
          initialData: '',
          builder: (_, snapshot) {
            if ((snapshot.data) == null) {
              return const SizedBox();
            }

            return getImageBuilder(
              'https://adventurelearner.herokuapp.com/api/v1/app/read-file$imagePath',
              snapshot.data ?? '',
              BorderRadius.circular(0),
              fit: BoxFit.cover,
              placeHolder: placeHolderImage(
                Get.height,
                Get.width,
                BorderRadius.circular(0),
              ),
            );
          }),
    );
  }
}
