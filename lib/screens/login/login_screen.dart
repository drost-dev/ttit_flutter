import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/default.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filled(
          onPressed: () {},
          icon: Image.asset('assets/icons/arrow_left.png'),
          //alignment: Alignment.center,
          style: TextButton.styleFrom(
            //alignment: Alignment.center,
            backgroundColor: theme.colorScheme.onPrimary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      style: theme.textTheme.labelLarge,
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
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Email',
                              style: theme.textTheme.labelMedium,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'asdasdds',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: theme.colorScheme.blue,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 14,
                              ),
                            ),
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            child: Text(
                              'Пароль',
                              style: theme.textTheme.labelMedium,
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          TextFormField(),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
