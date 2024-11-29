import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/order.dart';
import 'package:flutter_application_1/themes/default.dart';

@RoutePage()
class DetailsOrderScreen extends StatefulWidget {
  const DetailsOrderScreen({super.key, required this.order});

  final Order order;

  @override
  State<DetailsOrderScreen> createState() => _DetailsOrderScreenState();
}

class _DetailsOrderScreenState extends State<DetailsOrderScreen> {
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
          widget.order.id.toString(),
          style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.black,
              height: null),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20)
            .add(const EdgeInsets.only(top: 16)),
        child: const Column(
          children: [],
        ),
      ),
    );
  }
}
