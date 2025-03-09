import 'package:eventrack_app/app/models/response.dart';
import 'package:eventrack_app/app/modules/admin_dashboard/provider/admin_dashboard_provider.dart';
import 'package:eventrack_app/app/services/http_service.dart';
import 'package:eventrack_app/app/services/http_service_impl.dart';
import 'package:get/get.dart';

class AdminDashboardProviderImpl implements AdminDashboardProvider{
  late HttpService _httpService;

   AdminDashboardProviderImpl() {
    _httpService = Get.put(HttpImplementation());
    _httpService.init();
  }

  @override
  Future<ResponseModel> getDashboardData()async{
    final ResponseModel response = await _httpService.getRequest('/admin/dashboard');
    print(response);
    return response;
  }
@override
  Future<ResponseModel> getEvents() async {
    try {
      final ResponseModel response =
          await _httpService.getRequest('/admin/e');
          print(response);
      return response;
    } on Exception catch (e) {
      print(e);
      return ResponseModel(state: false, message: e.toString());
    }
  }

}