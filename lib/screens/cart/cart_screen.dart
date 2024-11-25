import 'package:auto_route/auto_route.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_card.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_application_1/widgets/product_card_full.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<ProductCard> products = [
    ProductCard(
      name: 'Nike Club Max',
      price: 584.95,
      image: Image.asset('images/nike1.png'),
    ),
    ProductCard(
      name: 'Nike Air Max 200',
      price: 94.05,
      image: Image.asset('images/nike2.png'),
    ),
    ProductCard(
      name: 'Nike Air Max 270 Essential',
      price: 74.95,
      image: Image.asset('images/nike3.png'),
    ),
  ];

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
          'Корзина',
          style:
              theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20)
            .add(const EdgeInsets.only(top: 16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${products.length} товара',
                style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.black,
                    height: null,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
            ),
            const SizedBox(height: 14),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ProductCardFull(
                  productCard: products[index],
                  onDelete: () => products.removeAt(index),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 14);
              },
              itemCount: products.length,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 258,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20)
            .add(const EdgeInsets.only(top: 34, bottom: 32)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 56,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Сумма',
                        style: theme.textTheme.titleMedium
                            ?.apply(color: theme.colorScheme.grey),
                      ),
                      Text(
                        '₽753.95',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Доставка',
                        style: theme.textTheme.titleMedium
                            ?.apply(color: theme.colorScheme.grey),
                      ),
                      Text(
                        '₽60.20',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DottedLine(
                    dashColor: theme.colorScheme.grey,
                    lineThickness: 2,
                    dashLength: 6,
                    dashGapLength: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Итого',
                        style: theme.textTheme.titleMedium
                            ?.apply(color: theme.colorScheme.black),
                      ),
                      Text(
                        '₽814.15',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              constraints: const BoxConstraints.expand(height: 50),
              child: ElevatedButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: theme.colorScheme.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  'Оформить заказ',
                  style: theme.textTheme.labelLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
