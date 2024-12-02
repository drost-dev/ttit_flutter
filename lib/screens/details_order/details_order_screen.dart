import 'package:auto_route/auto_route.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/order.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_application_1/widgets/order_details_card.dart';
import 'package:flutter_application_1/widgets/order_details_field.dart';

@RoutePage()
class DetailsOrderScreen extends StatefulWidget {
  const DetailsOrderScreen({super.key, required this.order});

  final Order order;

  @override
  State<DetailsOrderScreen> createState() => _DetailsOrderScreenState();
}

class _DetailsOrderScreenState extends State<DetailsOrderScreen> {
  String? email = 'emmanueloyiboke@gmail.com';
  String? phone = '+234-811-732-5298';
  String? cardNumber = '0696 4629';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20)
              .add(const EdgeInsets.only(top: 16)),
          child: Column(
            children: [
              OrderDetailsCard(order: widget.order),
              const SizedBox(height: 12),
              OrderDetailsField(
                  email: email, phone: phone, cardNumber: cardNumber),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                constraints: const BoxConstraints(minHeight: 70),
                padding: const EdgeInsets.all(8),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    BarcodeWidget(
                      data: '4870200721267',
                      barcode: Barcode.ean13(),
                      height: 53,
                      drawText: false,
                      padding: const EdgeInsets.only(left: 30, right: 20),
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        'Открыть',
                        style: theme.textTheme.labelSmall?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            height: 22 / 12,
                            letterSpacing: 0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
