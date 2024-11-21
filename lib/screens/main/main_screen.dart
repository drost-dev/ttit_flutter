import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/router/router.dart';
import 'package:flutter_application_1/themes/default.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final _routes = const [
    HomeRoute(),
    FavouriteRoute(),
    NotificationRoute(),
    ProfileRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AutoTabsRouter(
      routes: _routes,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        tabsRouter.addListener(() {
          // print(tabsRouter.routeCollection.routes.first.name);
          // print(_routes.first.routeName);
          // tabsRouter.routeCollection.routes;
          setState(() {
            selectedIndex = tabsRouter.activeIndex;
          });
        });
        final hideBottomNav = context.topRouteMatch.meta['hideNavBar'] == true;
        return Scaffold(
          body: child,
          bottomNavigationBar: hideBottomNav
              ? null
              : SizedBox(
                  height: 106,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('/images/bottom_bar_bg_4x.png'),
                        fit: BoxFit.fitWidth,
                        scale: 4,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 56,
                            height: 56,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(91, 158, 225, 0.6),
                                  offset: Offset(0, 8),
                                  blurRadius: 24,
                                ),
                              ],
                            ),
                            child: IconButton.filled(
                              onPressed: () {},
                              icon: Image.asset(
                                'icons/bag.png',
                                height: 24,
                                width: 24,
                                color: Colors.white,
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: theme.colorScheme.blue,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 31)
                              .add(const EdgeInsets.only(top: 52, bottom: 30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 87,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          setState(() {
                                            //selectedIndex = 0;
                                          });
                                          tabsRouter.setActiveIndex(0);
                                        },
                                        icon: Image.asset(
                                          'icons/home.png',
                                          scale: 4,
                                          color: selectedIndex == 0
                                              ? theme.colorScheme.blue
                                              : theme.colorScheme.grey,
                                        ),
                                        style: IconButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                        ),
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          setState(() {
                                            //selectedIndex = 1;
                                          });
                                          tabsRouter.setActiveIndex(1);
                                        },
                                        icon: Image.asset(
                                          'icons/heart.png',
                                          scale: 4,
                                          color: selectedIndex == 1
                                              ? theme.colorScheme.blue
                                              : theme.colorScheme.grey,
                                        ),
                                        style: IconButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                        ),
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 121),
                              SizedBox(
                                width: 88,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          tabsRouter.setActiveIndex(2);
                                        },
                                        icon: Image.asset(
                                          'icons/bell.png',
                                          scale: 4,
                                          color: selectedIndex == 2
                                              ? theme.colorScheme.blue
                                              : theme.colorScheme.grey,
                                        ),
                                        style: IconButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                        ),
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          tabsRouter.setActiveIndex(3);
                                        },
                                        icon: Image.asset(
                                          'icons/person.png',
                                          scale: 4,
                                          color: selectedIndex == 3
                                              ? theme.colorScheme.blue
                                              : theme.colorScheme.grey,
                                        ),
                                        style: IconButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                        ),
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
