import 'package:eventrack_app/app/modules/admin_dashboard/provider/admin_dashboard_provider_impl.dart';
import 'package:eventrack_app/app/modules/userdashboard/controllers/userdashboard_controller.dart';
import 'package:get/get.dart';

import '../controllers/admin_dashboard_controller.dart';

class AdminDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AdminDashboardProviderImpl>(AdminDashboardProviderImpl());

     Get.lazyPut<AdminDashboardController>(
      () => AdminDashboardController(),
    );
  }
}
