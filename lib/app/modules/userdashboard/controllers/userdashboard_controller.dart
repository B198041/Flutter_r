import 'package:eventrack_app/app/models/user/user.dart';
import 'package:get/get.dart';

import '../../../global_widgets/message.dart';
import '../../../models/event/event.dart';
import '../../../models/response.dart';
import '../../../routes/app_pages.dart';
import '../../initLoad/controllers/init_load_controller.dart';
import '../provider/user_dashboard_impl.dart';
import '../provider/user_provider.dart';

class UserdashboardController extends GetxController {
  late List<Event> events;
  late UserDashboardProvider dashboardProvider;
  late RxList<Event> _myFavourite;
  late RxList<Event> _myEvents;
  late InitLoadController global;
  late User user; 

  List<Event> get favourites => _myFavourite;
  List<Event> get myEvents => _myEvents;

  String get fav => 'My Favourites';
  String get my => 'My Events';

  @override
  void onInit() async {
       InitLoadController _initLoadController = Get.find<InitLoadController>();

    // ✅ Call only if currentUser is null or not loaded
      _initLoadController.getCurrentUser();

    Get.put(UserProviderImpl());
    global = Get.find<InitLoadController>();
    dashboardProvider = Get.find<UserProviderImpl>();
    _myFavourite = <Event>[].obs;
    _myEvents = <Event>[].obs;
    user = global.currentUser;
    events = global.events;
    getMyFavourite();
    getMyEvents();
    super.onInit();
  }

  void seeAll(String type) {
    List<Event> arguments = [];
    if (type == fav)
      arguments = favourites;
    else if (type == my)
    {
      arguments = myEvents;
    Get.toNamed(Routes.EVENT_LIST, arguments: {'events': arguments});
    }
    else
    {

      arguments = global.events;
    Get.toNamed(Routes.EVENT_LIST, arguments: {'events': arguments});
    }

      
  }

  updateMyFavourite(bool state, Event event) => state
      ? _myFavourite.removeAt(
          _myFavourite.indexWhere((element) => element.id == event.id))
      : _myFavourite.insert(0, event);

  updateMyEvents(bool state, Event event) => state
      ? _myEvents
          .removeAt(_myEvents.indexWhere((element) => element.id == event.id))
      : _myEvents.insert(0, event);

  getMyFavourite() async {
    ResponseModel? events = await dashboardProvider.getMyFavouriteEvents();
    FlashMessage(events!.state, message: events.message);
    if (events.state) _myFavourite.value = events.eventList!;
  }

  getMyEvents() async {
    ResponseModel? events = await dashboardProvider.getMyEvents();
    FlashMessage(events!.state, message: events.message);
    if (events.state) _myEvents.value = events.eventList!;
  }
}
