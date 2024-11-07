import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  int timerTick = 0;

  late Timer t;

  @override
  void dispose() {
    // TODO: implement dispose
    t.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      t = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (timer.tick >= 30) {
          setState(() {
            timer.cancel();
            timerTick = 0;
          });
        } else {
          setState(() {
            timerTick = timer.tick;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    void startTimer() {
      setState(() {
        t = Timer.periodic(const Duration(seconds: 1), (timer) {
          if (timer.tick >= 30) {
            setState(() {
              timer.cancel();
              timerTick = 0;
            });
          } else {
            setState(() {
              timerTick = timer.tick + 1;
            });
          }
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filled(
          onPressed: () {
            Navigator.of(context).maybePop();
          },
          icon: Image.asset('assets/icons/arrow_left.png'),
          style: TextButton.styleFrom(
            backgroundColor: theme.colorScheme.onPrimary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                //all
                height: 313,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 315,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'OTP проверка',
                            style: theme.textTheme.displayMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Пожалуйста, проверьте свою электронную почту, чтобы увидеть код подтверждения',
                            style: theme.textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 179,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text(
                                'OTP Код',
                                style: theme.textTheme.headlineMedium,
                              ),
                            ),
                          ),
                          OtpTextField(
                            fieldWidth: 46,
                            fieldHeight: 99,
                            margin: EdgeInsets.zero,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            numberOfFields: 6,
                            hasCustomInputDecoration: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: theme.colorScheme.lightGrey,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              counterText: '',
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 17,
                                vertical: 37,
                              ),
                            ),
                            textStyle: theme.textTheme.bodyMedium,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: GestureDetector(
                              onTap: () {
                                if (!t.isActive) {
                                  startTimer();
                                  setState(() {
                                    timerTick = 1;
                                  });
                                }
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Отправить заново',
                                    style: theme.textTheme.labelSmall,
                                  ),
                                  Text(
                                    '00:${(30 - timerTick).toString().padLeft(2, '0')}',
                                    style: theme.textTheme.labelSmall,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
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
