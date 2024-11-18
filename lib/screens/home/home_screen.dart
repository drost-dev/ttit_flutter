import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/router/router.dart';
import 'package:flutter_application_1/themes/default.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        LoginRoute(),
        SignUpRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          // bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: tabsRouter.activeIndex,
          //   onTap: (value) => tabsRouter.setActiveIndex(value),
          //   items: const [
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.login),
          //       label: 'Login',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.person),
          //       label: 'Sign Up',
          //     ),
          //   ],
          // ),
          bottomNavigationBar: SizedBox(
            height: 106,
            child: Stack(
              //fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: Image.asset(
                    '/images/bottom_bar_bg_4x.png',
                    scale: 4,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)),
                    alignment: Alignment.center,
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 87,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'icons/home.png',
                                    scale: 4,
                                  ),
                                  style: IconButton.styleFrom(
                                      backgroundColor: Colors.transparent),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'icons/heart.png',
                                    scale: 4,
                                  ),
                                  style: IconButton.styleFrom(
                                      backgroundColor: Colors.transparent),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            width: 121,
                          ),
                          SizedBox(
                            width: 88,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'icons/bell.png',
                                    scale: 4,
                                  ),
                                  style: IconButton.styleFrom(
                                      backgroundColor: Colors.transparent),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'icons/person.png',
                                    //color: Theme.of(context).colorScheme.grey,
                                    scale: 4,
                                  ),
                                  style: IconButton.styleFrom(
                                      backgroundColor: Colors.transparent),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
