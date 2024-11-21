import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_application_1/widgets/cart_button.dart';
import 'package:flutter_application_1/widgets/product_card.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton.filled(
        //     onPressed: () {
        //       AutoRouter.of(context).maybePop();
        //     },
        //     icon: Image.asset('assets/icons/arrow_left.png'),
        //     style: TextButton.styleFrom(
        //       backgroundColor: theme.colorScheme.onPrimary,
        //     ),
        //   ),
        // ],
        title: SizedBox(
          width: 335,
          height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('icons/logo.png'),
              Text(
                'Главная',
                style: theme.textTheme.displayMedium,
              ),
              const CartButton(isEmpty: true),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 19, left: 20, right: 20),
          child: Container(
            //width: 335,
            height: 52,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 269,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Color.fromRGBO(0, 0, 0, 0.04),
                      ),
                    ],
                  ),
                  child: TextField(
                    style: theme.textTheme.labelMedium?.copyWith(
                      height: 20 / 12,
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.darkGrey,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Поиск',
                      isDense: true, //нужно, чтобы работал contentPadding
                      contentPadding: const EdgeInsets.only(right: 57),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                            right: 12, left: 26, top: 14, bottom: 14),
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: ImageIcon(
                            const AssetImage(
                              'icons/search.png',
                            ),
                            color: theme.colorScheme.darkGrey,
                          ),
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 52,
                  height: 52,
                  child: IconButton.filled(
                    onPressed: () {},
                    icon: Image.asset(
                      'icons/sliders.png',
                      height: 24,
                      width: 24,
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: theme.colorScheme.blue,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
