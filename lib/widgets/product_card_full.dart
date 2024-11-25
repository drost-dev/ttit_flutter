import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_card.dart';
import 'package:flutter_application_1/themes/default.dart';

class ProductCardFull extends StatefulWidget {
  const ProductCardFull({super.key, required this.productCard, this.onDelete});

  final ProductCard productCard;
  final void Function()? onDelete;

  @override
  State<ProductCardFull> createState() => _ProductCardFullState();
}

class _ProductCardFullState extends State<ProductCardFull> {
  int amount = 1;

  bool _isAnimating = false;
  bool _showAmount = false;
  bool _showDelete = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onPanUpdate: (details) {
        if (!_isAnimating) {
          if (details.delta.dx > 0) {
            //вправо
            if (!_showAmount) {
              setState(() => _isAnimating = true);
              if (!_showDelete) {
                //чисто
                setState(() => _showAmount = true);
              } else {
                //есть удаление
                setState(() => _showDelete = false);
              }
            }
          } else {
            //влево
            if (!_showDelete) {
              setState(() => _isAnimating = true);
              if (!_showAmount) {
                //чисто
                setState(() => _showDelete = true);
              } else {
                //есть количество
                setState(() => _showAmount = false);
              }
            }
          }
        }
      },
      child: Row(
        children: [
          //amount button
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 104,
            width: _showAmount ? 58 : 0,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: theme.colorScheme.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 14,
                  height: 14,
                  child: IconButton(
                    onPressed: () {
                      setState(() => amount++);
                    },
                    icon: Image.asset(
                      'icons/plus.png',
                      color: Colors.white,
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
                Text(
                  amount.toString(),
                  style: theme.textTheme.labelSmall
                      ?.copyWith(fontSize: 14, color: Colors.white),
                ),
                Container(
                  width: 14,
                  height: 14,
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (amount > 1) amount--;
                      });
                    },
                    icon: Image.asset(
                      'icons/minus.png',
                      color: Colors.white,
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //card
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: _showAmount
                ? const EdgeInsets.only(left: 10)
                : (_showDelete
                    ? const EdgeInsets.only(right: 10)
                    : EdgeInsets.zero),
            onEnd: () {
              setState(() => _isAnimating = false);
            },
            height: 104,
            width: (_showAmount || _showDelete) ? 267 : 335,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 9, left: 10),
              child: Row(
                children: [
                  Container(
                    width: 87,
                    height: 85,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.lightGrey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: widget.productCard.image,
                  ),
                  const SizedBox(width: 30),
                  Flexible(
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 46),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productCard.name,
                            style: theme.textTheme.titleMedium,
                          ),
                          Text(
                            '₽${(widget.productCard.price * amount).toStringAsFixed(2)}',
                            style: theme.textTheme.bodySmall
                                ?.apply(color: theme.colorScheme.black),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          //delete button
          GestureDetector(
            onTap: widget.onDelete,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 104,
              width: _showDelete ? 58 : 0,
              decoration: BoxDecoration(
                color: theme.colorScheme.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: SizedBox(
                  width: 18,
                  height: 20,
                  child: ImageIcon(
                    AssetImage('icons/trash.png'),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
