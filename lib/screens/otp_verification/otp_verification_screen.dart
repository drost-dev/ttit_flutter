import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/router/router.dart';
import 'package:flutter_application_1/screens/otp_verification/bloc/otp_verification_screen_bloc.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_application_1/widgets/auth_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

@RoutePage()
class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});
  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  int timerTick = 0;
  final OtpVerificationScreenBloc _bloc = OtpVerificationScreenBloc();

  late Timer t;

  @override
  void dispose() {
    // TODO: implement dispose
    t.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _bloc.add(OtpVerificationScreenLoad());
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

    return AuthScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Center(
          child: BlocConsumer(
            bloc: _bloc,
            listener: (context, state) {
              switch (state) {
                case OtpVerificationScreenError():
                  final snackBar = SnackBar(
                    content: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                      child: Text(state.e),
                    ),
                    behavior: SnackBarBehavior.floating,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  break;
                case OtpVerificationScreenSuccess():
                  AutoRouter.of(context).push(const MainRoute());
                  break;
              }
            },
            builder: (context, state) {
              switch (state) {
                case OtpVerificationScreenLoading():
                  return const CircularProgressIndicator();
                case OtpVerificationScreenLoaded():
                  return Column(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    onSubmit: (value) {
                                      _bloc.add(
                                        OtpVerificationScreenSignIn(
                                          email: widget.email,
                                          otpCode: value,
                                        ),
                                      );
                                    },
                                    fieldWidth: 46,
                                    fieldHeight: 99,
                                    margin: EdgeInsets.zero,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 17,
                                        vertical: 37,
                                      ),
                                    ),
                                    textStyle: theme.textTheme.bodyMedium,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (!t.isActive) {
                                          startTimer();
                                          _bloc.add(OtpVerificationScreenResend(
                                            email: widget.email,
                                          ));
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
                  );
                default:
                  return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
