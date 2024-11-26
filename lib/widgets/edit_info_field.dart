import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/default.dart';

enum EditInfoFieldType {
  email('emmanueloyiboke@gmail.com', 'Email', 'icons/mail.png'),
  phone('+234-811-732-5298', 'Телефон', 'icons/phone.png');

  final String value;
  final String text;
  final String iconPath;

  const EditInfoFieldType(this.value, this.text, this.iconPath);
}

class EditInfoField extends StatelessWidget {
  const EditInfoField({
    super.key,
    required this.type,
  });

  final EditInfoFieldType type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: theme.colorScheme.lightGrey,
                      ),
                      margin: const EdgeInsets.only(right: 12),
                      child: Image.asset(type.iconPath),
                    ),
                    SizedBox(
                      height: 40,
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            type.value,
                            style: theme.textTheme.bodySmall
                                ?.copyWith(
                              height: 20 / 14,
                              color: theme.colorScheme.black,
                              letterSpacing: 0,
                            ),
                          ),
                          Text(
                            type.text,
                            style: theme.textTheme.labelMedium
                                ?.copyWith(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                width: 20,
                child: Image.asset('icons/edit.png'),
              )
            ],
          )
        ],
      ),
    );
  }
}
