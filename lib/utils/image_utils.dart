import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/generated/assets.dart';

Widget getImageBuilder(
  String? url,
  BorderRadius radius, {
  BoxFit? fit,
  Widget? placeHolder,
  double? height,
  double? width,
}) {
  final placeHolderToShow = placeHolder ?? const SizedBox();
  if (url == null || url.isEmpty) return placeHolderToShow;

  return CachedNetworkImage(
    imageUrl: 'http://68.178.202.229:3000/api/v1/app/read-file$url',
    height: height,
    width: width,
    httpHeaders: {
      'x-access-token': constCtr.token,
    },
    imageBuilder: (_, imageProvider) => Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        image: DecorationImage(
          image: imageProvider,
          fit: fit,
        ),
      ),
    ),
    placeholder: (_, __) => placeHolderToShow,
    errorWidget: (_, __, ___) => placeHolderToShow,
  );
}

Widget placeHolderImage(
  double height,
  double width,
  BorderRadius radius,
) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: radius,
      image: const DecorationImage(
        image: AssetImage(
          Assets.imagesPlaceholder,
        ),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget circularProfileImage(String url, double radius) {
  return CircleAvatar(
    backgroundColor: greyColor5,
    radius: radius,
    backgroundImage: NetworkImage(
      'http://68.178.202.229:3000/api/v1/app/read-file$url',
      headers: {'x-access-token': constCtr.token},
    ),
  );
}
