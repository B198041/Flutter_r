import 'package:eventrack_app/app/modules/userdashboard/controllers/userdashboard_controller.dart';
import 'package:eventrack_app/app/modules/userdashboard/provider/user_dashboard_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/initLoad/controllers/init_load_controller.dart';
import '../routes/app_pages.dart';
import '../services/shared_prefs.dart';

class AppDrawer extends GetView<InitLoadController>  {

  @override
  Widget build(BuildContext context) {
    Get.put(UserdashboardController());
    Get.put(UserProviderImpl());

    // Access InitLoadController and call getCurrentUser
    // InitLoadController _initLoadController = Get.find<InitLoadController>();
    // _initLoadController.getCurrentUser();
       InitLoadController _initLoadController = Get.find<InitLoadController>();

    // ✅ Call only if currentUser is null or not loaded
    if (_initLoadController.currentUser.name == null) {
      _initLoadController.getCurrentUser();
    }

    UserdashboardController _dashboard = Get.find<UserdashboardController>();

    return Drawer(
      child: ListView(
      padding: EdgeInsets.zero,
        children: [
          // Drawer Header
          GetBuilder<InitLoadController>(
            builder: (_controller) {
              return Container(
                height: 240,
                padding: EdgeInsets.all(16),

                child: DrawerHeader(
                  padding: EdgeInsets.zero,
  
                  margin: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Profile Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Image.network(
                          _controller.currentUser.profileImage ?? '',
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      // User Name
                      Text(
                        _controller.currentUser.name ?? 'Unknown',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      // Address (if available)
                      Text(
                        _controller.currentUser.address ?? 'No address',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                      // Email
                      Text(
                        _controller.currentUser.email ?? 'No email',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          // Divider between header and other items
          Divider(color: Colors.blueGrey),
          // Profile Item
          ListTile(
            title: Text("Profile", style: TextStyle(fontSize: 16)),
            onTap: () => Get.toNamed(Routes.USER_PROFILE),
            leading: Icon(Icons.person, color: Colors.blueAccent),
          ),
          // Organization Item
          GetBuilder<InitLoadController>(
            builder: (_controller) {
              return _controller.currentUser.organization == null
                  ? ListTile(
                      title: Text("Create Organization", style: TextStyle(fontSize: 16)),
                      onTap: () => Get.toNamed(Routes.CREATE_ORGANIZATION),
                      leading: Icon(Icons.create_rounded, color: Colors.blueAccent),
                    )
                  : ListTile(
                      title: Text("Your Organization", style: TextStyle(fontSize: 16)),
                      onTap: () => Get.toNamed(Routes.ORGANIZATION_PROFILE,
                          arguments: _controller.organization),
                      leading: Icon(Icons.business, color: Colors.blueAccent),
                    );
            },
          ),
          // Divider before Logout
          Divider(color: Colors.blueGrey),
          // Logout Item
          ListTile(
            title: Text("Logout", style: TextStyle(fontSize: 16)),
            onTap: () async => await SharedPreference.requestLogout(),
            leading: Icon(Icons.logout, color: Colors.blueAccent),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
