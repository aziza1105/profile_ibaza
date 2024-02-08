import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'assets/constants/routes.dart';
import 'core/adapter/hive_type_adapter.dart';
import 'core/database/objectbox.dart';
import 'core/injector/set_up_locator.dart';
import 'core/injector/storage_repository.dart';


void main() async {


  registerAdapters();
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  await HiveSingleton.getInstance();
  await LocalDatabase.getInstance();
  await Hive.initFlutter();
  var boxname = await Hive.openBox("name");
  var boxlocation = await Hive.openBox("location");
  var boxavatar = await Hive.openBox("avatar");

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}


class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,

    title: 'IBaza',

    onGenerateRoute: RouteGenerator.onGenerateRoute,

  );
}