import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/router/router.dart';
import 'package:flutter_application_1/themes/default.dart';

class CartButton extends StatefulWidget {
  const CartButton({
    super.key,
    this.isEmpty = true,
  });
  final bool isEmpty;

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        IconButton.filled(
          onPressed: () {
            context.router.push(const CartRoute());
          },
          icon: Image.asset('icons/bag.png'),
          style: TextButton.styleFrom(
            backgroundColor: theme.colorScheme.onPrimary,
          ),
        ),
        widget.isEmpty ? const SizedBox() : Positioned(
          right: 4,
          top: 6,
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.red,
              shape: BoxShape.circle,
            ),
            width: 8,
            height: 8,
          ),
        )
      ],
    );
  }
}
