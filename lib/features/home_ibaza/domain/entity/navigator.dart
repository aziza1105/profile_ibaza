import 'package:flutter/cupertino.dart';
import '../../../profile_ibaza/presentation/pages/profile_screen.dart';
import '../../presentation/widgets/catalog_screen.dart';
import '../../presentation/widgets/home_screen.dart';

class TabNavigatorRoutes {
  static const String root = '/';
}

class TabNavigator extends StatefulWidget {
  const TabNavigator({
    required this.navigatorKey,
    required this.tabItem,
    Key? key,
  }) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final NavItemEnum tabItem;

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>
    with AutomaticKeepAliveClientMixin {
  Map<String, WidgetBuilder> _routeBuilders(
      {required BuildContext context, required RouteSettings settings}) {
    switch (widget.tabItem) {
      case NavItemEnum.home:
        return {
          TabNavigatorRoutes.root: (context) => const SizedBox(),
        };
      case NavItemEnum.menu:
        return {
          TabNavigatorRoutes.root: (context) => const CatalogScreen(),
        };
      case NavItemEnum.bag:
        return {
          TabNavigatorRoutes.root: (context) => const SizedBox(),
        };
      case NavItemEnum.buy:
        return {
          TabNavigatorRoutes.root: (context) => const SizedBox(),
        };
      case NavItemEnum.user:
        return {
          TabNavigatorRoutes.root: (context) => const ProfileScreen(),
        };

      default:
        return {
          TabNavigatorRoutes.root: (context) => const Text("Error"),
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Navigator(
      key: widget.navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        final routeBuilders =
            _routeBuilders(context: context, settings: routeSettings);

        return CupertinoPageRoute<dynamic>(
          builder: (context) => routeBuilders.containsKey(routeSettings.name)
              ? routeBuilders[routeSettings.name]!(
                  context,
                )
              : Container(),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

PageRouteBuilder fade({required Widget page, RouteSettings? settings}) =>
    PageRouteBuilder<Widget>(
      transitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0,
            1,
            curve: Curves.linear,
          ),
        ),
        child: child,
      ),
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
    );
