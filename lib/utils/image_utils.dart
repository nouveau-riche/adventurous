import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:adventurous_learner_app/generated/assets.dart';

Widget getImageBuilder(
  String? url,
  String token,
  BorderRadius radius, {
  BoxFit? fit,
  Widget? placeHolder,
  double? height,
  double? width,
}) {
  final placeHolderToShow = placeHolder ?? const SizedBox();
  if (url == null || url.isEmpty) return placeHolderToShow;

  return CachedNetworkImage(
    imageUrl: url,
    height: height,
    width: width,
    httpHeaders: {
      'x-access-token': token,
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
