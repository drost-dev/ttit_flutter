import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_application_1/widgets/product_card_small.dart';

@RoutePage()
class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
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
          'Избранное',
          style:
              theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton.filled(
              onPressed: () {
                //AutoRouter.of(context).maybePop();
              },
              icon: Image.asset('icons/heart.png',
                  scale: 4, color: theme.colorScheme.black),
              style: TextButton.styleFrom(
                backgroundColor: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 24.75),
        child: Center(
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
                return const ProductCardSmall();
              },
            ),
          ),
        ),
      ),
    );
  }
}
