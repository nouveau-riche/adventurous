import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:url_launcher/url_launcher.dart';

printLog(dynamic value, {bool isError = false}) {
  if (kDebugMode) {
    log("--------- App logs ---------\n$value");
  }
}

showSnackBar(String message, {isError = false}) {
  Get.closeAllSnackbars();
  Get.showSnackbar(
    GetSnackBar(
      messageText: Row(
        children: [
          if (isError) ...[
            const Icon(Icons.error_outline, color: Colors.white, size: 18),
            const SizedBox(width: 6)
          ],
          Text(
            message,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isError ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      backgroundColor: isError ? Colors.red : greenColor1,
    ),
  );
}

void openURL(String url) async => await canLaunchUrl(Uri.parse(url))
    ? await launchUrl(Uri.parse(url))
    : showSnackBar("Oops! Something went wrong", isError: true);

hideKeyBoard() => SystemChannels.textInput.invokeMethod('TextInput.hide');
