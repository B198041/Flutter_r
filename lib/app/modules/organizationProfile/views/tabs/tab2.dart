import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/tiles/eventCard.dart';
import '../../controllers/organization_profile_controller.dart';

class OrganizationProfileTab2 extends GetView<OrganizationProfileController> {
  const OrganizationProfileTab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.createdEventList.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 10),
                  child: Text(
                    "Organized Events",
                    style: Get.textTheme.headlineMedium!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      return EventCard(controller.createdEventList[index]);
                    },
                    itemCount: controller.createdEventList.length,
                  ),
                ),
              ],
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'No Event Found',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),
    );
  }
}
