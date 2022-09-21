import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:adventurous_learner_app/generated/assets.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/data/modals/notification/notification_response.dart'
    as n;

class NotificationWidget extends StatelessWidget {
  final n.Notification? notification;

  const NotificationWidget({
    Key? key,
    this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateTime = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(
      notification?.createdAt ?? '',
      true,
    );

    return ListTile(
      dense: true,
      leading: Container(
        height: 38,
        width: 38,
        decoration: const BoxDecoration(
          color: oliveColor,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(11),
        child: Image.asset(Assets.iconsNotification),
      ),
      title: Text(
        notification?.body ?? '',
        style: const TextStyle(
          fontSize: 14.2,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        timeago.format(dateTime.toLocal()),
        style: const TextStyle(
          color: greyColor9,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
