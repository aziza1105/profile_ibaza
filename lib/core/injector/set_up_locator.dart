import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/authentication/data/models/authenticated_user.dart';

class HiveSingleton {HiveSingleton._();

  static Box? _hive;
  static HiveSingleton? _instance;

  static Future<HiveSingleton> getInstance() async {
    if (_instance == null) {
      final storage = HiveSingleton._();
      await storage.init();
      _instance = storage;

    }
    return _instance!;
  }

  Future<void> init() async {
    const boxName = "Box";
    Directory directory = await getApplicationCacheDirectory();
    Hive.init(directory.path);
    _hive = await Hive.openBox<dynamic>(boxName);
  }

  static Future<void> putName() async {
    await _hive?.put("is_hive", AuthenticatedUserModel(id: '35478655', firstName: "Aziza", lastName: "Narziyeva"));
  }

  static getName() {

    return _hive?.get("is_hive", defaultValue: "error");

  }
}