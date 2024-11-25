import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/router/router.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_application_1/widgets/cart_button.dart';
import 'package:flutter_application_1/widgets/product_card_small.dart';

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
        //scrolledUnderElevation: 0, //свойство запрещает появление тени при прокрутке (не ворк)
        //surfaceTintColor: Colors.transparent,
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //search
            Padding(
              padding: const EdgeInsets.only(top: 19, left: 20, right: 20),
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
            const SizedBox(height: 24),
            //categories
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 21),
              child: Container(
                constraints: const BoxConstraints(minHeight: 75),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Категории',
                        style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600, height: null),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var items = ['Все', 'Outdoor', 'Tennis', 'Running'];
                          return GestureDetector(
                            onTap: () {
                              context.router.push(ListingRoute(index: index));
                            },
                            child: Container(
                              width: 108,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                items[index],
                                style: theme.textTheme.labelMedium
                                    ?.apply(color: theme.colorScheme.black),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 16);
                        },
                        itemCount: 4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 11.5, right: 28.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Популярное',
                    style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: theme.colorScheme.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.router.push(const PopularRoute());
                    },
                    child: Text(
                      'Все',
                      style: theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.blue),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 184.5,
              padding: const EdgeInsets.only(left: 16, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.filled(2, const ProductCardSmall()),
              ),
            ),
            const SizedBox(height: 40.5),
            Container(
              padding: const EdgeInsets.only(left: 18, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Акции',
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600, height: null),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2, bottom: 1),
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Все',
                        style: theme.textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 21),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset('images/summer_sale.png'),
            ),
          ],
        ),
      ),
    );
  }
}
