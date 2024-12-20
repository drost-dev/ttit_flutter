import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_application_1/widgets/profile_input_field.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameKey = GlobalKey<FormFieldState>();
  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.router.back();
          },
          icon: const ImageIcon(
            AssetImage('icons/arrow_left.png'),
          ),
        ),
        title: Text(
          'Заказы',
          style:
              theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
        ),
        child: Container(
          constraints: const BoxConstraints(minHeight: 490),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Image.asset('images/ava.png'),
                  ),
                  Positioned.fill(
                    left: 7,
                    bottom: -2,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme.colorScheme.blue,
                          border: Border.fromBorderSide(
                            BorderSide(
                              width: 1,
                              color: theme.colorScheme.lightGrey,
                            ),
                          ),
                        ),
                        width: 19,
                        child: const ImageIcon(
                          AssetImage('icons/edit_profile.png'),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                constraints: const BoxConstraints(minHeight: 386),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileInputField(
                      fieldKey: _nameKey,
                      onChanged: (value) {},
                      type: FieldType.name,
                      initialValue: "EMMANUEL OYIBOKE",
                    ),
                    const SizedBox(height: 12),
                    Container(
                      constraints: const BoxConstraints(minHeight: 190),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProfileInputField(
                            fieldKey: _emailKey,
                            onChanged: (value) {},
                            type: FieldType.email,
                            initialValue: "emmanueloyiboke@gmail.com",
                          ),
                          ProfileInputField(
                            fieldKey: _passwordKey,
                            onChanged: (value) {},
                            type: FieldType.password,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {},
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Восстановить пароль',
                          style: theme.textTheme.labelMedium,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      constraints: const BoxConstraints.expand(height: 50),
                      child: ElevatedButton(
                        onPressed: () {
                          bool nameValid = _nameKey.currentState!.validate();
                          bool emailValid = _emailKey.currentState!.validate();
                          bool passwordValid =
                              _passwordKey.currentState!.validate();

                          if (nameValid && emailValid && passwordValid) {}
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: theme.colorScheme.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Text(
                          'Сохранить',
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
      ),
    );
  }
}
