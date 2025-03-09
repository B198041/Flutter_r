import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../utilities/colors.dart';

class FlashMessage {
  ///Displays a `Snackbar`
  ///
  ///On `state: false`, the background of the `Snackbar` is red.
  ///On `state: true`, the background of the `Snackbar` is green.
  ///
  ///If you do not want to display the `Snackbar`, do not pass `message`.
  FlashMessage(bool state, {String? message, bool displayOnSuccess = false}) {
    if (message != null || message != '') {
      if (state) {
        if (displayOnSuccess) _successFlash(message);
      } else
        _errorFlash(message);
    }
  }

  static _successFlash(String? message) {
    return Get.snackbar(
      'Success',
      message!,
      icon: Icon(Icons.check_circle, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: 3),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static _errorFlash(String? message) {
    return Get.snackbar(
      'Error',
      message!,
      icon: Icon(Icons.error, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: 3),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
