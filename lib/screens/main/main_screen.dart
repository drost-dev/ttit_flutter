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

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        FavouriteRoute(),
        NotificationRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        final hideBottomNav = context.topRouteMatch.meta['hideNavBar'] == true;
        return Scaffold(
          body: child,
          bottomNavigationBar: hideBottomNav ? null : SizedBox(
            height: 106,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('/images/bottom_bar_bg_4x.png'),
                  fit: BoxFit.fitWidth,
                  scale: 4,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 31)
                    .add(const EdgeInsets.only(top: 52, bottom: 30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 87,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  selectedIndex = 0;
                                });
                                tabsRouter.setActiveIndex(0);
                              },
                              icon: Image.asset(
                                'icons/home.png',
                                scale: 4,
                                color: selectedIndex == 0 ? blue : grey,
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
                                  selectedIndex = 1;
                                });
                                tabsRouter.setActiveIndex(1);
                              },
                              icon: Image.asset(
                                'icons/heart.png',
                                scale: 4,
                                color: selectedIndex == 1 ? blue : grey,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                color: selectedIndex == 2 ? blue : grey,
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
                                color: selectedIndex == 3 ? blue : grey,
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
            ),
          ),
        );
      },
    );
  }
}
