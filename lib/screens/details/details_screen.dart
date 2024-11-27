import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_application_1/widgets/cart_button.dart';
import 'package:flutter_application_1/widgets/product_card_small.dart';

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
      body: Padding(
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
    );
  }
}
