import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/themes/default.dart';

enum FieldType {
  name,
  email,
  password,
}

enum Params {
  title,
  validator,
  inputFormatters,
  hintText,
}

Map<FieldType, Map<Params, dynamic>> settings = {
  FieldType.name: {
    Params.title: 'Ваше имя',
    Params.validator: (String? value) {
      if (RegExp(r'^[A-Za-zА-Яа-я]+').stringMatch(value ?? '') == value) {
        return null;
      } else {
        return 'Введено некорректное имя!';
      }
    },
    Params.inputFormatters: [
      FilteringTextInputFormatter.allow(
        RegExp(r'[a-zA-Zа-яА-Я]'),
      ),
    ],
    Params.hintText: 'xxxxxxxx',
  },
  FieldType.email: {
    Params.title: 'Email',
    Params.validator: (String? value) {
      if (RegExp(r'^[a-z0-9.]+\@[a-z0-9]+\.[a-z]{2,}').stringMatch(value ?? '') ==
          value) {
        return null;
      } else {
        return 'Введён некорректный адрес!';
      }
    },
    Params.inputFormatters: [
      FilteringTextInputFormatter.allow(
        RegExp(r'[a-z@.0-9]'),
      ),
    ],
    Params.hintText: 'xyz@gmail.com',
  },
  FieldType.password: {
    Params.title: 'Пароль',
    Params.validator: (String? value) {
      if (RegExp(r'^[a-zA-Z0-9,.?!@#$%^&*()_+=\-/]{8,16}')
              .stringMatch(value ?? '') ==
          value) {
        return null;
      } else {
        return 'Введён некорректный пароль!';
      }
    },
    Params.inputFormatters: [
      FilteringTextInputFormatter.allow(
        RegExp(r'[a-zA-Z0-9,.?!@#$%^&*()_+=\-/]'),
      ),
    ],
    Params.hintText: '••••••••',
  },
};

class InputField extends StatelessWidget {
  InputField({
    super.key,
    required this.fieldKey,
    required this.onChanged,
    required this.type,
  });

  var fieldKey = GlobalKey<FormFieldState>();
  void Function(String)? onChanged;
  FieldType type;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      //text+textformfield
      constraints: const BoxConstraints(minHeight: 80),
      child: Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                settings[type]![Params.title],
                style: theme.textTheme.titleMedium,
              ),
            ),
            TextFormField(
              key: fieldKey,
              validator: settings[type]![Params.validator],
              onChanged: onChanged,
              inputFormatters: settings[type]![Params.inputFormatters],
              decoration: InputDecoration(
                hintText: settings[type]![Params.hintText],
                hintStyle: theme.textTheme.bodySmall!
                    .apply(letterSpacingDelta: type == FieldType.name ? 2 : 0),
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
              obscureText: type == FieldType.password ? true : false,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
