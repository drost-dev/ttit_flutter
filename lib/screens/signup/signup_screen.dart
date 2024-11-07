import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login/login_screen.dart';
import 'package:flutter_application_1/themes/default.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            //text+textformfield
                            height: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Ваше имя',
                                    style: theme.textTheme.titleMedium,
                                  ),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'xxxxxxxx',
                                    hintStyle: theme.textTheme.bodySmall!
                                        .apply(letterSpacingDelta: 2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: theme.colorScheme.lightGrey,
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 14,
                                    ),
                                  ),
                                  style: theme.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 298,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 190,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        //text+textformfield
                                        height: 80,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'Email',
                                                style:
                                                    theme.textTheme.titleMedium,
                                              ),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                hintText: 'xyz@gmail.com',
                                                hintStyle:
                                                    theme.textTheme.bodySmall,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  borderSide: BorderSide.none,
                                                ),
                                                filled: true,
                                                fillColor:
                                                    theme.colorScheme.lightGrey,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 16,
                                                  horizontal: 14,
                                                ),
                                              ),
                                              style: theme.textTheme.bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        //text+textformfield
                                        height: 80,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'Пароль',
                                                style:
                                                    theme.textTheme.titleMedium,
                                              ),
                                            ),
                                            TextFormField(
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                hintText: '••••••••',
                                                hintStyle:
                                                    theme.textTheme.bodySmall,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  borderSide: BorderSide.none,
                                                ),
                                                filled: true,
                                                fillColor:
                                                    theme.colorScheme.lightGrey,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 16,
                                                  horizontal: 14,
                                                ),
                                                suffixIcon: IconButton(
                                                  onPressed: () {},
                                                  icon: const ImageIcon(
                                                    AssetImage('icons/eye.png'),
                                                  ),
                                                ),
                                              ),
                                              style: theme.textTheme.bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 18,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: theme.colorScheme.lightGrey,
                                      ),
                                      child: const ImageIcon(
                                        AssetImage('icons/shield.png'),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Flexible(
                                      child: Text(
                                        'Даю согласие на обработку персональных данных',
                                        style: theme.textTheme.titleMedium,
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  constraints:
                                      const BoxConstraints.expand(height: 50),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      backgroundColor: theme.colorScheme.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
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
          ),
        ),
      ),
    );
  }
}
