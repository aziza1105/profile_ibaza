import 'package:hive/hive.dart';
import '../../features/authentication/data/models/authenticated_user.dart';

void registerAdapters() {
  Hive.registerAdapter(AuthenticatedUserModelAdapter());
}