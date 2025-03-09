import 'package:eventrack_app/app/utilities/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/init_load_controller.dart';

class InitLoadView extends GetView<InitLoadController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InitLoadController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
