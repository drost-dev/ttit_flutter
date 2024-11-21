import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/router/router.dart';
import 'package:flutter_application_1/screens/signup/bloc/sign_up_screen_bloc.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_application_1/widgets/auth_scaffold.dart';
import 'package:flutter_application_1/widgets/input_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpScreenBloc _bloc = SignUpScreenBloc();

  String nameValue = '';
  final _nameKey = GlobalKey<FormFieldState>();

  String emailValue = '';
  final _emailKey = GlobalKey<FormFieldState>();

  String passwordValue = '';
  final _passwordKey = GlobalKey<FormFieldState>();

  bool _agreed = false;

  @override
  void initState() {
    _bloc.add(SignUpScreenLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AuthScaffold(
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
          child: BlocConsumer(
            bloc: _bloc,
            listener: (context, state) {
              switch (state) {
                case SignUpScreenError():
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
                case SignUpScreenCompleted():
                  AutoRouter.of(context).replace(const MainRoute());
                  break;
              }
            },
            builder: (context, state) {
              switch (state) {
                case SignUpScreenLoading():
                  return const CircularProgressIndicator();
                case SignUpScreenLoaded():
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 514,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 315,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Регистрация',
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
                              height: 390,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InputField(
                                    fieldKey: _nameKey,
                                    onChanged: (value) {
                                      setState(() {
                                        nameValue = value;
                                      });
                                    },
                                    type: FieldType.name,
                                  ),
                                  SizedBox(
                                    height: 298,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _agreed = !_agreed;
                                                });
                                              },
                                              child: Container(
                                                width: 18,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  color: theme
                                                      .colorScheme.lightGrey,
                                                ),
                                                child: _agreed
                                                    ? const ImageIcon(
                                                        AssetImage(
                                                            'icons/shield.png'),
                                                      )
                                                    : null,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Flexible(
                                              child: Text(
                                                'Даю согласие на обработку персональных данных',
                                                style: theme
                                                    .textTheme.titleMedium!
                                                    .apply(
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          constraints:
                                              const BoxConstraints.expand(
                                                  height: 50),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              bool nameValid = _nameKey
                                                  .currentState!
                                                  .validate();
                                              bool emailValid = _emailKey
                                                  .currentState!
                                                  .validate();
                                              bool passwordValid = _passwordKey
                                                  .currentState!
                                                  .validate();

                                              if (nameValid &&
                                                  emailValid &&
                                                  passwordValid &&
                                                  _agreed) {
                                                _bloc.add(
                                                  SignUpScreenRegister(
                                                    name: nameValue,
                                                    email: emailValue,
                                                    password: passwordValue,
                                                  ),
                                                );
                                              }
                                            },
                                            style: TextButton.styleFrom(
                                              backgroundColor:
                                                  theme.colorScheme.blue,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                              ),
                                            ),
                                            child: Text(
                                              'Зарегистрироваться',
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
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(const LoginRoute());
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Есть аккаунт? ',
                            style: theme.textTheme.titleMedium!
                                .apply(color: theme.colorScheme.darkGrey),
                            children: [
                              TextSpan(
                                text: 'Войти',
                                style: theme.textTheme.titleMedium,
                              ),
                            ],
                          ),
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
