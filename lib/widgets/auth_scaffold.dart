import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/default.dart';

class AuthScaffold extends StatefulWidget {
  const AuthScaffold({super.key, required this.body,});

  final Widget body;

  @override
  State<AuthScaffold> createState() => _AuthScaffoldState();
}

class _AuthScaffoldState extends State<AuthScaffold> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    theme = theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        surface: theme.colorScheme.onPrimary,
        onPrimary: theme.colorScheme.surface,
      ),
    );

    return Theme(
      data: theme,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: IconButton.filled(
            onPressed: () {
              AutoRouter.of(context).maybePop();
            },
            icon: Image.asset('assets/icons/arrow_left.png', color: theme.colorScheme.black),
            style: TextButton.styleFrom(
              backgroundColor: theme.colorScheme.onPrimary,
            ),
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        body: widget.body,
      ),
    );
  }
}
