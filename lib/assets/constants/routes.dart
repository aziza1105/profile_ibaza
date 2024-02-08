import 'package:flutter/material.dart';

import '../../features/home_ibaza/presentation/widgets/home_screen.dart';
import '../../features/profile_ibaza/presentation/pages/profile_screen.dart';


class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {

    switch (settings.name) {

    case '/profile':
    return MaterialPageRoute(builder: (context) =>  const ProfileScreen(),);

     default:
     return MaterialPageRoute(builder: (context) => const HomeScreen(),);
    }
  }
}