import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/otp_verification/otp_verification_screen.dart';
import 'package:flutter_application_1/screens/reset_password/bloc/reset_password_screen_bloc.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_application_1/widgets/input_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _bloc = ResetPasswordScreenBloc();

  String emailValue = '';
  final _emailKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    // TODO: implement initState
    _bloc.add(ResetPasswordScreenLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    Future<void> showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          Future.delayed(const Duration(seconds: 2), () {
            if (context.mounted) {
              Navigator.of(context).pop(true);
            }
          });
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              content: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 30,
                ),
                height: 196,
                width: 335,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.blue,
                        shape: BoxShape.circle,
                      ),
                      width: 44,
                      height: 44,
                      child: Image.asset('icons/email.png'),
                    ),
                    SizedBox(
                      height: 68,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Проверьте Ваш Email',
                            style: theme.textTheme.titleSmall,
                          ),
                          Text(
                            'Мы отправили код восстановления пароля на вашу электронную почту.',
                            style: theme.textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
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
          child: BlocConsumer(
            bloc: _bloc,
            listener: (context, state) {
              switch (state) {
                case ResetPasswordScreenError():
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
                case ResetPasswordScreenCompleted():
                  showMyDialog().whenComplete(() {
                    if (context.mounted) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              OtpVerificationScreen(email: emailValue),
                        ),
                      );
                    }
                  });

                  break;
              }
            },
            builder: (context, state) {
              switch (state) {
                case ResetPasswordScreenLoading():
                  return const CircularProgressIndicator();
                case ResetPasswordScreenLoaded():
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        //all
                        height: 272,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 315,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Забыл пароль',
                                    style: theme.textTheme.displayMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Введите свою учетную запись для сброса',
                                    style: theme.textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            InputField(
                              fieldKey: _emailKey,
                              onChanged: (value) {
                                setState(() {
                                  emailValue = value;
                                });
                              },
                              type: FieldType.email,
                            ),
                            Container(
                              constraints:
                                  const BoxConstraints.expand(height: 50),
                              child: ElevatedButton(
                                onPressed: () {
                                  bool emailValid =
                                      _emailKey.currentState!.validate();
                                  if (emailValid) {
                                    _bloc.add(ResetPasswordScreenSendCode(
                                        email: emailValue));
                                  }
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: theme.colorScheme.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                child: Text(
                                  'Отправить',
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                            ),
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
