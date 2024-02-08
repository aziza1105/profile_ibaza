import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../assets/constants/icons.dart';
import '../../../profile_ibaza/presentation/pages/profile_screen.dart';
import '../../data/models/nav_bar_item.dart';
import '../../data/models/navbar_models.dart';
import '../../domain/entity/navigator.dart';
import 'catalog_screen.dart';


enum NavItemEnum { home, menu, bag, buy, user  }

class HomeScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const HomeScreen());

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
 _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _controller;
  //late double navBarWidth;
  // List<ModelBottomShet> ls = [
  //   ModelBottomShet(icon: AppIcons.home, text: "Asosiy"),
  //   ModelBottomShet(icon: AppIcons.catalog, text: "Katalog"),
  //   ModelBottomShet(icon: AppIcons.bag, text: "Buyurtmalar"),
  //   ModelBottomShet(icon: AppIcons.buy, text: "Savatcha"),
  //   ModelBottomShet(icon: AppIcons.user, text: "Profil"),
  // ];

  late AnimationController controller;
  final Map<NavItemEnum, GlobalKey<NavigatorState>> _navigatorKeys = {
    NavItemEnum.home: GlobalKey<NavigatorState>(),
    NavItemEnum.menu: GlobalKey<NavigatorState>(),
    NavItemEnum.bag: GlobalKey<NavigatorState>(),
    NavItemEnum.buy: GlobalKey<NavigatorState>(),
    NavItemEnum.user: GlobalKey<NavigatorState>(),
  };

  List<NavBar> labels = [];

  int _currentIndex = 0;
  int currentPage = 0;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));

    _controller = TabController(length: 5, vsync: this);
    controller.addListener(() {});
    _controller.addListener(onTabChange);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTabChange() {
    setState(() => _currentIndex = _controller.index);
  }

  Widget _buildPageNavigator(NavItemEnum tabItem) => TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      );

  void changePage(int index) {
    setState(() => _currentIndex = index);
    _controller.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    labels = const [
      NavBar(id: 0, icon: AppIcons.home, title: "Asosiy"),
      NavBar(id: 1, icon: AppIcons.catalog, title: "Katalog"),
      NavBar(id: 2, icon: AppIcons.bag, title: "Buyurtmalar"),
      NavBar(id: 3, icon: AppIcons.buy, title: "Savatcha"),
      NavBar(id: 4, icon: AppIcons.user, title: "Profil"),
    ];

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
      ),
      child: HomeTabControllerProvider(
        controller: _controller,
        child: WillPopScope(
          onWillPop: () async {
            final isFirstRouteInCurrentTab =
                !await _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                    .currentState!
                    .maybePop();
            if (isFirstRouteInCurrentTab) {
              if (NavItemEnum.values[_currentIndex] != NavItemEnum.home) {
                changePage(0);
                return false;
              }
            }
            return isFirstRouteInCurrentTab;
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            bottomNavigationBar: Container(
              height: 94 + MediaQuery.of(context).padding.bottom,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TabBar(
                enableFeedback: true,
                onTap: (index) {},
                indicator: const BoxDecoration(),
                controller: _controller,
                labelPadding: EdgeInsets.zero,
                tabs: [
                  TabItemWidget(
                    onActiveTap: () {
                      _navigatorKeys[NavItemEnum.values[_currentIndex]]
                          ?.currentState
                          ?.popUntil((route) => route.isFirst);
                    },
                    isActive: _currentIndex == 0,
                    item: labels[0],
                  ),
                  TabItemWidget(
                    onActiveTap: () {
                      _navigatorKeys[NavItemEnum.values[_currentIndex]]
                          ?.currentState
                          ?.popUntil((route) => route.isFirst);
                    },
                    isActive: _currentIndex == 1,
                    item: labels[1],
                  ),
                  TabItemWidget(
                    onActiveTap: () {
                      _navigatorKeys[NavItemEnum.values[_currentIndex]]
                          ?.currentState
                          ?.popUntil((route) => route.isFirst);
                    },
                    isActive: _currentIndex == 2,
                    item: labels[2],
                  ),
                  TabItemWidget(
                    onActiveTap: () {
                      _navigatorKeys[NavItemEnum.values[_currentIndex]]
                          ?.currentState
                          ?.popUntil((route) => route.isFirst);
                    },
                    isActive: _currentIndex == 3,
                    item: labels[3],
                  ),
                  TabItemWidget(
                    onActiveTap: () {
                      _navigatorKeys[NavItemEnum.values[_currentIndex]]
                          ?.currentState
                          ?.popUntil((route) => route.isFirst);
                    },
                    isActive: _currentIndex == 4,
                    item: labels[4],
                  ),
                ],
              ),
            ),
            body: TabBarView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildPageNavigator(NavItemEnum.home),
                const CatalogScreen(),
                _buildPageNavigator(NavItemEnum.bag),
                _buildPageNavigator(NavItemEnum.buy),
               const ProfileScreen()
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class HomeTabControllerProvider extends InheritedWidget {
  const HomeTabControllerProvider({
    required Widget child,
    required this.controller,
    Key? key,
  }) : super(key: key, child: child);

  final TabController controller;

  @override
  bool updateShouldNotify(HomeTabControllerProvider oldWidget) => false;

  static HomeTabControllerProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<HomeTabControllerProvider>()!;
}
