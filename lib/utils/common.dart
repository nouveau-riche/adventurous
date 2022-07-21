import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

printLog(dynamic value, {bool isError = false}) {
  if (kDebugMode) {
    log("--------- App logs ---------\n$value");
  }
}

Future<bool?> toast(String message) async {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    fontSize: 15.0,
  );
}

showSnackbar(String message, [int timeInSec = 3]) {
  Get.showSnackbar(
    GetSnackBar(
      message: message,
      duration: Duration(seconds: timeInSec),
      snackStyle: SnackStyle.FLOATING,
    ),
  );
}
