import 'package:path_provider/path_provider.dart';

import '../../objectbox.g.dart';

class LocalDatabase{
  static LocalDatabase? _database;
  static Store? _store;

  static Future<LocalDatabase> getInstance() async{
    if (_database == null){

      _store = await _init();
      _database = LocalDatabase._();
    }
   return _database!;
  }
  static Future<Store> _init() async {
    final applicationDirectory = await getApplicationDocumentsDirectory();
    final store = await openStore(directory:'${applicationDirectory.path}/database');
    return store;
  }
  LocalDatabase._();
}