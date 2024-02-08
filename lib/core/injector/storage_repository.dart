

import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository{
  static StorageRepository? _repository;
  static SharedPreferences? _preferences;
  static Future<StorageRepository?> getInstance() async{

    if(_repository == null){
      final store = StorageRepository._();
      await store._init();
      _repository = store;
    }

    return _repository;
  }
  StorageRepository._();

  Future _init() async{
    _preferences = await SharedPreferences.getInstance();

  }

  static bool getAuthStatus(){
    return _preferences?.getBool("isAuthenticated") ?? false;
  }

  static Future<bool?> setAuthStatus(bool value)async{
    return await _preferences?.setBool('isAuthenticated', value);
  }

  static setStatus(bool bool) {}
}
