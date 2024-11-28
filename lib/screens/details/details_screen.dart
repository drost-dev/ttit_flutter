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
  double currentY = -34;
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
                'Популярное',
                style: theme.textTheme.titleSmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const CartButton(isEmpty: false),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20)
                .add(const EdgeInsets.only(top: 26)),
            child: Column(
              children: [
                Text(
                  'Nike Air Max 270 Essential',
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Men’s Shoes',
                  style: theme.textTheme.titleMedium
                      ?.apply(color: theme.colorScheme.darkGrey),
                ),
                const SizedBox(height: 8),
                Text('₽179.39',
                    style: theme.textTheme.labelLarge?.copyWith(
                        height: null,
                        fontSize: 24,
                        color: theme.colorScheme.black)),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 113),
            padding: const EdgeInsets.only(left: 12, right: 11),
            constraints: const BoxConstraints(minHeight: 161),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 77,
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
                                    a - 38.57 / 2) {
                                  setState(() {
                                    currentX = currentX + details.delta.dx;
                                    currentY = b * sqrt(1 - (currentX * currentX) / (a * a));
                                    currentY *= -1;
                                  });
                                }
                                // print(MediaQuery.of(context).size.width / 2 + currentX);
                                // print(MediaQuery.of(context).size.width / 2 - currentX);
                                // print(details.delta.dx);
                              },
                              child: Container(
                                width: 38.57,
                                height: 18,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.darkGrey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
