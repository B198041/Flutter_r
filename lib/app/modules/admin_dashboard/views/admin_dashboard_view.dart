import 'package:eventrack_app/app/modules/initLoad/controllers/init_load_controller.dart';
import 'package:eventrack_app/app/modules/userdashboard/controllers/userdashboard_controller.dart';
import 'package:eventrack_app/app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/app_drawer.dart';
import '../controllers/admin_dashboard_controller.dart';
import 'overviewContainer.dart';

class AdminDashboardView extends GetView<AdminDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ETAppBar(
        title: 'Admin View',
      ),
      drawer: AppDrawer(),
    body: RefreshIndicator(
      onRefresh: () async{
        controller.getDasboardData();
        controller.getMyEvents();
          InitLoadController _controller = Get.find<InitLoadController>();
          _controller.getCurrentUser();

      },
      child: GetBuilder<AdminDashboardController>(
        builder: (context) {
          return ListView(
              children: [
                SizedBox(height: 20,),
                OverviewContainer(
                  title: 'Users',
                  items: controller.user,
                ),
                OverviewContainer(
                  title: 'Events',
                  items: controller.event,            
                ),
                OverviewContainer(
                  title: 'Organizations',
                  items: controller.organization,
                ),
                SizedBox(height: 40,),
          
              ],
            ).paddingOnly(bottom: 12);
        }
      ),
      ),
    );
  }
}
