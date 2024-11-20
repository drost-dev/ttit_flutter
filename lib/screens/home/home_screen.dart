import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
              Text(
                'Главная',
                style: theme.textTheme.displayMedium,
              )
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: ProductCard(),
      ),
    );
  }
}
