import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login/login_screen.dart';
import 'package:flutter_application_1/screens/otp_verification/otp_verification_screen.dart';
import 'package:flutter_application_1/screens/reset_password/reset_password_screen.dart';
import 'package:flutter_application_1/screens/signup/signup_screen.dart';
import 'package:flutter_application_1/themes/default.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: defaultTheme,
      home: const LoginScreen(),
    );
  }
}