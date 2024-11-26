import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_application_1/widgets/edit_info_field.dart';

@RoutePage()
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Future<void> showMyDialog() async {
    //   return showDialog<void>(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (BuildContext context) {
    //       Future.delayed(const Duration(seconds: 7), () {
    //         if (context.mounted) {
    //           AutoRouter.of(context).maybePop(true);
    //         }
    //       });
    //       return BackdropFilter(
    //         filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
    //         child: Container(
    //           margin: const EdgeInsets.only(
    //                 left: 20, right: 20, top: 264, bottom: 173),
    //           width: MediaQuery.of(context).size.width,
    //           child: AlertDialog(
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(20),
    //             ),
    //             content: Stack(
    //               children: [
    //                 Positioned.fill(
    //                   child: Container(
    //                     constraints: const BoxConstraints(minHeight: 214),
    //                     padding: const EdgeInsets.only(
    //                         left: 88, right: 88, top: 40, bottom: 121),
    //                     child: Column(
    //                       mainAxisSize: MainAxisSize.min,
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Container(
    //                           width: 134,
    //                           height: 134,
    //                           padding: const EdgeInsets.all(24),
    //                           decoration: BoxDecoration(
    //                             shape: BoxShape.circle,
    //                             color: theme.colorScheme.lightBlue,
    //                           ),
    //                           child: Image.asset(
    //                             'images/confetti.png',
    //                             width: 86,
    //                             height: 86,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             // insetPadding: const EdgeInsets.only(
    //             //     left: 20, right: 20, top: 264, bottom: 173),
    //             insetPadding: EdgeInsets.zero,
    //             contentPadding: EdgeInsets.zero,
    //           ),
    //         ),
    //       );
    //     },
    //   );
    // }

    // Future<void> showMyDialog() async {
    //   return showDialog<void>(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (BuildContext context) {
    //       Future.delayed(const Duration(seconds: 7), () {
    //         if (context.mounted) {
    //           AutoRouter.of(context).maybePop(true);
    //         }
    //       });
    //       return BackdropFilter(
    //         filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
    //         child: SizedBox(
    //           width: MediaQuery.of(context).size.width,
    //           // margin: const EdgeInsets.only(
    //           //   left: 0,
    //           //   right: 0,
    //           //   top: 264,
    //           //   bottom: 173,
    //           // ),
    //           child: AlertDialog(
    //             insetPadding: EdgeInsets.zero,
    //             contentPadding: EdgeInsets.zero,
    //             content: Container(
    //               color: Colors.black,
    //               constraints: const BoxConstraints(minHeight: 375),
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   );
    // }

    Future<void> showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          Future.delayed(const Duration(seconds: 7), () {
            if (context.mounted) {
              AutoRouter.of(context).maybePop(true);
            }
          });
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              content: Container(
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
                    // Positioned.fill(
                    //   child: Padding(
                    //     padding: EdgeInsets.only(
                    //       left: 50,
                    //       right: 50,
                    //       bottom: 40,
                    //     ),
                    //     child: Container(
                    //       width: 70,
                    //       height: 51,
                    //       color: theme.colorScheme.blue,
                    //     ),
                    //   ),
                    // ),
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
                                // AutoRouter.of(context).push(
                                //   OtpVerificationRoute(email: emailValue),
                                // );
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
        child: Container(
          //main white
          height: 425,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            //fields, map, payment
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //contact info
                constraints: const BoxConstraints(minHeight: 132),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Контактная информация',
                      style: theme.textTheme.labelLarge?.copyWith(
                          height: 20 / 14,
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.black),
                    ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 96),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          EditInfoField(type: EditInfoFieldType.email),
                          EditInfoField(type: EditInfoFieldType.phone),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //map
              Container(
                margin: const EdgeInsets.only(right: 12),
                constraints: const BoxConstraints(minHeight: 165),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          constraints: const BoxConstraints(minHeight: 48),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Адрес',
                                style: theme.textTheme.labelLarge?.copyWith(
                                    height: 20 / 14,
                                    fontWeight: FontWeight.w500,
                                    color: theme.colorScheme.black),
                              ),
                              Text(
                                '1082 Аэропорт, Нигерии',
                                style: theme.textTheme.labelMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset(
                            'icons/arrow_down.png',
                          ),
                        ),
                      ],
                    ),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      constraints:
                          const BoxConstraints(minHeight: 101, minWidth: 295),
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Image.asset(
                            'images/map.png',
                            fit: BoxFit.fill,
                          )),
                          Container(
                              constraints: const BoxConstraints(
                                  minHeight: 101, minWidth: 295),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.33),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 19)
                                  .add(const EdgeInsets.only(
                                      left: 8, right: 18)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Посмотреть на карте',
                                      style: theme.textTheme.headlineSmall),
                                  Container(
                                    width: 36,
                                    height: 36,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromRGBO(91, 158, 225, 0.5),
                                          offset: Offset(0, 10),
                                          blurRadius: 24,
                                        ),
                                      ],
                                    ),
                                    child: IconButton.filled(
                                      onPressed: () {
                                        //TODO: map
                                      },
                                      icon: Image.asset(
                                        'icons/marker.png',
                                        height: 20,
                                        width: 20,
                                        color: Colors.white,
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            theme.colorScheme.darkBlue,
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //payment
              Container(
                constraints: const BoxConstraints(minHeight: 72),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Способ оплаты',
                      style: theme.textTheme.labelLarge?.copyWith(
                          height: 20 / 14,
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 40,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color:
                                                    theme.colorScheme.lightGrey,
                                              ),
                                              margin: const EdgeInsets.only(
                                                  right: 12),
                                              child: Image.asset(
                                                  'icons/card_dbl.png'),
                                            ),
                                            SizedBox(
                                              height: 40,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'DbL Card',
                                                    style: theme
                                                        .textTheme.bodySmall
                                                        ?.copyWith(
                                                      height: 20 / 14,
                                                      color: theme
                                                          .colorScheme.black,
                                                      letterSpacing: 0,
                                                    ),
                                                  ),
                                                  Text(
                                                    '**** **** 0696 4629',
                                                    style: theme
                                                        .textTheme.labelMedium
                                                        ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset(
                            'icons/arrow_down.png',
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
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
                  showMyDialog().whenComplete(() {
                    if (context.mounted) {
                      // AutoRouter.of(context).push(
                      //   OtpVerificationRoute(email: emailValue),
                      // );
                    }
                  });
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
