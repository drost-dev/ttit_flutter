import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_application_1/widgets/edit_info_field.dart';

class OrderDetailsField extends StatelessWidget {
  const OrderDetailsField({
    super.key,
    required this.email,
    required this.phone,
    required this.cardNumber,
  });

  final String? email;
  final String? phone;
  final String? cardNumber;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EditInfoField(
                        type: EditInfoFieldType.email,
                        value: email,
                      ),
                      EditInfoField(
                        type: EditInfoFieldType.phone,
                        value: phone,
                      ),
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
                                                '**** **** ${cardNumber ?? ''}',
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
    );
  }
}
