import 'package:eventrack_app/app/models/response.dart';

abstract class AdminDashboardProvider {
  Future<ResponseModel> getDashboardData();
  Future<ResponseModel> getEvents();
  
}