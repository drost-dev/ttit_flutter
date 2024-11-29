import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/order.dart';
import 'package:flutter_application_1/router/router.dart';
import 'package:flutter_application_1/themes/default.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  late String date;

  @override
  void initState() {
    var nowDT = DateTime.now();
    var hoursDiff = nowDT.difference(widget.order.orderDate).inHours;
    if (hoursDiff > DateTime.now().hour + 24) {
      date = '$hoursDiff дн назад';
    } else if (hoursDiff <= DateTime.now().hour + 24 && hoursDiff > DateTime.now().hour) {
      date =
          '${widget.order.orderDate.hour.toString().padLeft(2, '0')}:${widget.order.orderDate.minute.toString().padLeft(2, '0')}';
    } else if (hoursDiff <= DateTime.now().hour && hoursDiff > 1) {
      date = '$hoursDiff ч назад';
    } else {
      date = '${nowDT.difference(widget.order.orderDate).inMinutes} мин назад';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        context.router.push(DetailsOrderRoute(order: widget.order));
      },
      child: Container(
        constraints: const BoxConstraints(minHeight: 105),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: 87,
                  height: 85,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.lightGrey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    widget.order.product.imagePath,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 14),
                Container(
                  width: 152,
                  constraints: const BoxConstraints(minHeight: 80),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '№ ${widget.order.id}',
                        style: theme.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.darkBlue,
                            height: null),
                      ),
                      Text(
                        widget.order.product.name,
                        style: theme.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.black,
                            height: null),
                      ),
                      Container(
                        constraints: const BoxConstraints(minWidth: 134),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${widget.order.totalPrice.toStringAsFixed(2)}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: theme.colorScheme.black,
                                height: 20 / 14,
                              ),
                            ),
                            Text(
                              '\$${widget.order.price.toStringAsFixed(2)}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: theme.colorScheme.darkGrey,
                                height: 20 / 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                //'7 мин назад',
                date,
                style: theme.textTheme.bodySmall
                    ?.copyWith(height: 20 / 14, letterSpacing: 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
