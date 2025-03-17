import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/constants.dart';

class StorageService {
  late final SharedPreferences _preferences;
  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return  this ;
  }
  Future<bool> setString(String key, String value) async {
    return   _preferences.setString(key, value);
  }
  Future<bool> setBool(String key, bool value) async {
    return   _preferences.setBool(key, value);
  }
  bool getDeviceFirstOpen(){
    return _preferences.getBool(Constants.STORAGE_DEVICE_OPEN_FIRST_KEY)?? false;
  }
  bool isLoggedIn(){
    if (_preferences.getString(Constants.STORAGE_USER_PROFILE_KEY) != null) {
      return true;
    } else {
      return false;
    }
  }
}