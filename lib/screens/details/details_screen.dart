import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_application_1/widgets/cart_button.dart';

@RoutePage()
class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
    this.id = -1,
  });
  final int id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  double currentX = 0;
  double currentY = -38;

  int selectedIndex = 0;

  final int a = 176;
  final int b = 38;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 335,
          height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton.filled(
                onPressed: () {
                  context.router.back();
                },
                icon: Image.asset('assets/icons/arrow_left.png',
                    color: theme.colorScheme.black),
                style: TextButton.styleFrom(
                  backgroundColor: theme.colorScheme.onPrimary,
                ),
              ),
              Text(
                'Sneaker Shop',
                style: theme.textTheme.titleSmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const CartButton(isEmpty: false),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20)
                    .add(const EdgeInsets.only(top: 26)),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 259,
                      child: Text(
                        'Nike Air Max 270 Essential',
                        style: theme.textTheme.headlineLarge,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Men’s Shoes',
                      style: theme.textTheme.titleMedium
                          ?.apply(color: theme.colorScheme.darkGrey),
                    ),
                    const SizedBox(height: 8),
                    Text('₽179.39',
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(height: null, fontSize: 24)),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 113),
                constraints: const BoxConstraints(minHeight: 161),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //slider 😍😍😍😍😍😍😍
                    Container(
                      height: 77,
                      padding: const EdgeInsets.only(left: 12, right: 11),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Image.asset('images/ellipse.png'),
                          Positioned(
                            left: a - 38.57 / 2 + currentX,
                            top: b - 18 - currentY,
                            child: Align(
                              alignment: Alignment.center,
                              child: Transform.rotate(
                                angle: (b * b * currentX) / (a * a * currentY),
                                child: GestureDetector(
                                  onHorizontalDragUpdate: (details) {
                                    if ((currentX + details.delta.dx).abs() <
                                        a - 38.57 / 2 - 10) {
                                      setState(() {
                                        currentX = currentX + details.delta.dx;
                                        currentY = b *
                                            sqrt(1 -
                                                (currentX * currentX) /
                                                    (a * a));
                                        currentY *= -1;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: 38.57,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.darkGrey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'icons/arrow_left.png',
                                          color: Colors.white,
                                        ),
                                        Transform.flip(
                                          flipX: true,
                                          child: Image.asset(
                                            'icons/arrow_left.png',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //variants
                    Container(
                      height: 56,
                      padding: const EdgeInsets.only(left: 24, right: 14),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                  color: Color.fromRGBO(0, 0, 0, 0.02),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Image.asset('images/details_min_$index.png'),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 14);
                        },
                        itemCount: 5,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 33),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                constraints: const BoxConstraints(minHeight: 102),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Вставка Max Air 270 обеспечивает непревзойденный комфорт в течение всего дня. Изящный дизайн ........',
                      style: theme.textTheme.bodySmall?.copyWith(
                          height: 24 / 14, fontWeight: FontWeight.w400),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Подробнее',
                          style: theme.textTheme.bodySmall?.copyWith(
                              height: 21 / 14,
                              fontWeight: FontWeight.w400,
                              color: theme.colorScheme.darkBlue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned.fill(
            left: 53,
            right: 44,
            top: 133,
            bottom: 440,
            child: Image.asset(
              'images/details_$selectedIndex.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: theme.colorScheme.lightGrey,
        padding: const EdgeInsets.only(left: 48, bottom: 40, right: 27),
        child: Container(
          constraints: const BoxConstraints(minWidth: 300, minHeight: 52),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 52,
                height: 52,
                child: IconButton.filled(
                  onPressed: () {
                    //AutoRouter.of(context).maybePop();
                  },
                  icon: Image.asset('icons/heart2.png',
                      color: theme.colorScheme.black),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(217, 217, 217, 0.4),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 208,
                child: ElevatedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 13)
                        .add(const EdgeInsets.only(right: 46, left: 51)),
                    backgroundColor: theme.colorScheme.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.asset(
                          'icons/bag.png',
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'В корзину',
                        style: theme.textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
