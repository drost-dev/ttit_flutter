import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/reset_password/reset_password_screen.dart';
import 'package:flutter_application_1/screens/signup/signup_screen.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_application_1/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String emailValue = '';
  final _emailKey = GlobalKey<FormFieldState>();

  String passwordValue = '';
  final _passwordKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
        ).add(
          const EdgeInsets.only(
            top: 11,
            bottom: 47,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 416,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 315,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Привет!',
                            style: theme.textTheme.displayMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Заполните Свои данные или продолжите через социальные медиа',
                            style: theme.textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 292,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 218,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 190,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InputField(
                                        fieldKey: _emailKey,
                                        onChanged: (value) {
                                          setState(() {
                                            emailValue = value;
                                          });
                                        },
                                        type: FieldType.email,
                                      ),
                                      InputField(
                                        fieldKey: _passwordKey,
                                        onChanged: (value) {
                                          setState(() {
                                            passwordValue = value;
                                          });
                                        },
                                        type: FieldType.password,
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ResetPasswordScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Восстановить',
                                      style: theme.textTheme.labelMedium,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            constraints:
                                const BoxConstraints.expand(height: 50),
                            child: ElevatedButton(
                              onPressed: () {
                                _emailKey.currentState!.validate();
                                _passwordKey.currentState!.validate();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: theme.colorScheme.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: Text(
                                'Войти',
                                style: theme.textTheme.labelLarge,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Вы впервые? ',
                    style: theme.textTheme.titleMedium!
                        .apply(color: theme.colorScheme.darkGrey),
                    children: [
                      TextSpan(
                        text: 'Создать пользователя',
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
