import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_application_1/widgets/product_card_small.dart';

@RoutePage()
class ListingScreen extends StatefulWidget {
  const ListingScreen({super.key, this.index = 0});
  final int index;

  @override
  State<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  var items = ['Все', 'Outdoor', 'Tennis', 'Running'];
  late int selectedIndex = widget.index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filled(
          onPressed: () {
            context.router.back();
          },
          icon: Image.asset('assets/icons/arrow_left.png',
              color: theme.colorScheme.black),
          style: TextButton.styleFrom(
            backgroundColor: theme.colorScheme.onPrimary,
          ),
        ),
        title: Text(
          items[selectedIndex],
          style:
              theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //categories
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 20),
            child: Container(
              constraints: const BoxConstraints(minHeight: 75),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Категории',
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600, height: null),
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
                            //context.router.push(ListingRoute(index: index));
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            width: 108,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: selectedIndex == index ? theme.colorScheme.blue : Colors.white,
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
                      itemCount: items.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 21),
            child: SizedBox(
              width: 333,
              height: 629,
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 160 / 184.5,
                  mainAxisSpacing: 13,
                  crossAxisSpacing: 13,
                ),
                padding: const EdgeInsets.symmetric(vertical: 21),
                itemBuilder: (context, index) {
                  return const ProductCardSmall();
                },
              ),
            ),
          ),
        ],
      ),

      /* GridView
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 24.75),
        child: SizedBox(
          width: 333,
          height: 629,
          child: GridView.builder(
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 160 / 184.5,
              mainAxisSpacing: 13,
              crossAxisSpacing: 13,
            ),
            itemBuilder: (context, index) {
              return const ProductCard();
            },
          ),
        ),
      ),
      */
    );
  }
}
