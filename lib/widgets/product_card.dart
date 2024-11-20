import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 160,
      height: 184.5,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(
        left: 9,
        top: 3,
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //fav button
              SizedBox(
                width: 28,
                height: 28,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: ImageIcon(
                      const AssetImage(
                        'icons/heart2.png',
                      ),
                      color: theme.colorScheme.red,
                      size: 16,
                    ),
                  ),
                ),
              ),
              //gap
              const SizedBox(height: 3),
              //img
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: SizedBox(
                  width: 115,
                  height: 53.85,
                  child: Image.asset(
                    'images/nike_pro.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //gap
              const SizedBox(height: 12.6),
              SizedBox(
                height: 83,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BEST SELLER',
                      style: theme.textTheme.labelMedium?.apply(
                        fontWeightDelta: 1,
                        color: theme.colorScheme.blue,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Nike Air Max',
                      style: theme.textTheme.titleSmall?.apply(
                        fontWeightDelta: -1,
                        color: theme.colorScheme.darkGrey,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '₽752.00',
                      style: theme.textTheme.bodySmall?.apply(
                        color: theme.colorScheme.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),

          //add button
          Align(
            alignment: Alignment.bottomRight.add(
              const Alignment(0.84, 0.7),
            ),
            child: Container(
              width: 34 * 2,
              height: 35.5 * 2,
              decoration: BoxDecoration(
                color: theme.colorScheme.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 9.25, left: 7),
              child: Text('+',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 32,
                    height: 16 / 32,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
