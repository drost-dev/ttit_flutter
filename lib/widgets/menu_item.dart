import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.imgPath, required this.text});

  final String imgPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageIcon(
          AssetImage(imgPath),
          color: Colors.white,
        ),
        const SizedBox(width: 22),
        Text(
          text,
          style: theme.textTheme.titleMedium?.apply(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
