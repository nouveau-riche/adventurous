import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/data/controllers/review/review_controller.dart';

class ReviewImageWidget extends StatelessWidget {
  const ReviewImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(ReviewController());

    return GetBuilder<ReviewController>(
      builder: (_) {
        return Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: ctr.selectedImages.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10, top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          ctr.selectedImages[index],
                          height: 60,
                          width: 60,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        height: 16,
                        width: 16,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          splashColor: Colors.transparent,
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.white,
                            size: 12,
                          ),
                          onPressed: () => ctr.removeImage(index),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
