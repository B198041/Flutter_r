import 'package:eventrack_app/app/global_widgets/message.dart';
import 'package:eventrack_app/app/models/event/event.dart';
import 'package:eventrack_app/app/models/response.dart';
import 'package:eventrack_app/app/modules/admin_dashboard/provider/admin_dashboard_provider.dart';
import 'package:eventrack_app/app/modules/admin_dashboard/provider/admin_dashboard_provider_impl.dart';
import 'package:get/get.dart';

import '../../../utilities/colors.dart';
import '../../initLoad/controllers/init_load_controller.dart';
import '../models/overviewItemModel.dart';

class AdminDashboardController extends GetxController {
  late AdminDashboardProvider _adminDashboardController;
  late InitLoadController global;

  late List<Event> events;
  late RxList<Event> _myEvents;

  List<Event> get myEvents => _myEvents;

  // Observable lists for real-time UI updates
  final RxList<OverviewItemModel> user = <OverviewItemModel>[].obs;
  final RxList<OverviewItemModel> event = <OverviewItemModel>[].obs;
  final RxList<OverviewItemModel> organization = <OverviewItemModel>[].obs;

  @override
  void onInit() {
    _adminDashboardController = Get.find<AdminDashboardProviderImpl>();
    getDasboardData();
    _myEvents = <Event>[].obs;
    global = Get.find<InitLoadController>();
    getMyEvents();
    events = _myEvents;
    update();

    super.onInit();
  }

  Future<ResponseModel?> getDasboardData() async {
    try {
      ResponseModel? response =
          await _adminDashboardController.getDashboardData();

      print(response.toJson());
      if (response.state) {
        user.value = [
          OverviewItemModel(
              title: 'Total',
              count: response.users?['total'] ?? 0,
              color: AppColors.black),
          // OverviewItemModel(
          //     title: 'Verified',
          //     count: response.users?['verified'] ?? 0,
          //     color: AppColors.black),
          // OverviewItemModel(
          //     title: 'Unverified',
          //     count: response.users?['unverified'] ?? 0,
          //     color: AppColors.yellow),
        ];

        event.value = [
          OverviewItemModel(
              title: 'Total',
              count: response.events?['total'] ?? 0,
              color: AppColors.blue),
          OverviewItemModel(
              title: 'Upcoming',
              count: response.events?['upcoming'] ?? 0,
              color: AppColors.green),
          OverviewItemModel(
              title: 'Past',
              count: response.events?['past'] ?? 0,
              color: AppColors.yellow),
        ];

        organization.value = [
          OverviewItemModel(
              title: 'Total',
              count: response.organizations?['total'] ?? 0,
              color: AppColors.blue),
          OverviewItemModel(
              title: 'Verified',
              count: response.organizations?['verified'] ?? 0,
              color: AppColors.green),
          OverviewItemModel(
              title: 'Blocked',
              count: response.organizations?['blocked'] ?? 0,
              color: AppColors.red),
        ];
        update();
        return response;
      }
    } catch (e) {
      print(e);
      FlashMessage(false, message: e.toString());
      return null;
    }
    return null;
  }

  Future<ResponseModel> getMyEvents() async {
    final ResponseModel response = await _adminDashboardController.getEvents();
    print(response);
    _myEvents.value = response.eventList!;
    events = _myEvents;
    update();
    return response;
  }
}
