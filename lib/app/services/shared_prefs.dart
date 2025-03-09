import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_pages.dart';

class SharedPreference {
  static saveAuthState(String token) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('userauth-token'))
      await _prefs.remove('userauth-token');
    _prefs.setString('userauth-token', token);

    return;
  }

  static getAuthState() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? authToken;
    if (_prefs.containsKey('userauth-token')) {
      authToken = _prefs.getString('userauth-token');
      return authToken;
    }
    return;
  }

  static deleteAuthState() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print('delete token=======================');
    if (_prefs.containsKey('userauth-token')) _prefs.remove('userauth-token');
    print('token=================' + _prefs.get('userauth-token').toString());
    return;
  }

  static requestLogout() async {
    await deleteAuthState();
    Get.offNamed(Routes.LOGIN);
    return;
  }
}
