import 'package:eventrack_app/app/modules/admin_dashboard/controllers/admin_dashboard_controller.dart';
import 'package:eventrack_app/app/modules/user_list/bindings/user_list_binding.dart';
import 'package:eventrack_app/app/modules/userdashboard/bindings/userdashboard_binding.dart';
import 'package:eventrack_app/app/modules/userdashboard/controllers/userdashboard_controller.dart';
import 'package:eventrack_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utilities/colors.dart';
import '../models/overviewItemModel.dart';
import 'overviewTile.dart';

class OverviewContainer extends StatelessWidget {
  OverviewContainer({
    required this.title,
    required this.items,
  });

  final List<OverviewItemModel> items;
  final String title;

  final RxInt i = 0.obs;

  List<OverviewTile> _items(int index) {
    List<OverviewTile> returningItems = [];
    if (index == 0 && items.length % 2 != 0) {
      returningItems = [
        OverviewTile(
          items[index],
          width: Get.width - 72,
          onClicked: () => print(
              "Navigate to EVENT_LIST with filter as ${items[index].title} $title"),
        ),
      ];
      i.value++;
    } else {
      returningItems = [
        OverviewTile(
          items[index],
          onClicked: () => print(
            "Navigate to EVENT_LIST with filter as ${items[index].title} $title",
          ),
        ),
        OverviewTile(
          items[index + 1],
          onClicked: () => print(
            "Navigate to EVENT_LIST with filter as ${items[index + 1].title} $title",
          ),
        ),
      ];
      i.value += 2;
    }
    return returningItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
        border: Border.all(
          color: AppColors.dark25.withOpacity(0.3),
          width: 0.5,
        ),
        boxShadow: [
        ],
      ),
      child: Obx(
        () => Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style:
                        Get.textTheme.headlineSmall!.copyWith(color: AppColors.dark65),
                  ),

                  if(title == 'Events') TextButton(onPressed: (){
     final adminController = Get.find<AdminDashboardController>();  
                    
                     Get.toNamed(Routes.EVENT_LIST,arguments: {'events': adminController.events});
                  }, child: Text("See All",style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),)),
                ],
              ),
            ),
            for (; i.value < items.length;)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _items(i.value),
              ).paddingOnly(top: 12)
          ],
        ).paddingSymmetric(horizontal: 12, vertical: 12),
      ),
    ).paddingSymmetric(horizontal: 20, vertical: 8);
  }
}
