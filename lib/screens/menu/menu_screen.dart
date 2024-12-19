import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_application_1/widgets/menu_item.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.blue,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 78,
          left: 28,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 174,
              constraints: const BoxConstraints(minHeight: 134),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 48,
                    child: Image.asset('images/ava.png'),
                  ),
                  Text(
                    'Эмануэль Кверти',
                    style: theme.textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 55),
            Container(
              constraints: const BoxConstraints(minHeight: 290),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MenuItem(imgPath: 'icons/menu_person.png', text: 'Профиль'),
                  MenuItem(imgPath: 'icons/menu_bag.png', text: 'Корзина'),
                  MenuItem(imgPath: 'icons/menu_heart.png', text: 'Избранное'),
                  MenuItem(imgPath: 'icons/menu_truck.png', text: 'Заказы'),
                  MenuItem(imgPath: 'icons/menu_bell.png', text: 'Уведомления'),
                  MenuItem(
                      imgPath: 'icons/menu_settings.png', text: 'Настройки'),
                ],
              ),
            ),
            const SizedBox(height: 38),
            Container(
              color: Color.fromRGBO(247, 247, 249, 0.23),
              height: 1,
            ),
            const SizedBox(height: 30),
            const MenuItem(imgPath: 'icons/menu_logout.png', text: 'Выйти'),
          ],
        ),
      ),
    );
  }
}
