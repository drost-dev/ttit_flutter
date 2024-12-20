import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/router/router.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_application_1/widgets/order_details_field.dart';

@RoutePage()
class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? email = 'emmanueloyiboke@gmail.com';
  String? phone = '+234-811-732-5298';
  String? cardNumber = '0696 4629';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Future<void> showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              content: SizedBox(
                height: 375,
                width: 335,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 88, right: 88, top: 40, bottom: 121),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 134,
                              height: 134,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: theme.colorScheme.lightBlue,
                              ),
                              padding: const EdgeInsets.all(24),
                              child: Image.asset('images/confetti.png'),
                            ),
                            Flexible(
                              child: Text(
                                'Вы успешно оформили заказ',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    height: 28 / 20,
                                    letterSpacing: 0,
                                    color: theme.colorScheme.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50,
                        right: 50,
                        bottom: 40,
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          constraints: const BoxConstraints.expand(height: 51),
                          child: ElevatedButton(
                            onPressed: () {
                              if (context.mounted) {
                                context.router.popUntil((route) =>
                                    route.settings.name == CartRoute.page.name);
                                context.router.maybePop();
                              }
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: theme.colorScheme.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: Text(
                              'Вернуться к покупкам',
                              style: theme.textTheme.labelLarge,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              insetPadding: const EdgeInsets.only(
                  left: 20, right: 20, top: 264, bottom: 173),
              contentPadding: EdgeInsets.zero,
            ),
          );
        },
      );
    }

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
          'My Cart',
          style:
              theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14)
            .add(const EdgeInsets.only(top: 46)),
        child: OrderDetailsField(
            email: email, phone: phone, cardNumber: cardNumber),
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
            SizedBox(
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
                onPressed: () {
                  showMyDialog();
                },
                style: TextButton.styleFrom(
                  backgroundColor: theme.colorScheme.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  'Подтвердить',
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
