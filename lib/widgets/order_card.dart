import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/default.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({
    super.key,
    required this.orderDate,
  });

  final DateTime orderDate;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  late String date;

  @override
  void initState() {
    var nowDT = DateTime.now();
    var hoursDiff = nowDT.difference(widget.orderDate).inHours;
    if (hoursDiff > DateTime.now().hour + 24) {
      date = '$hoursDiff дн назад';
    } else if (hoursDiff <= DateTime.now().hour + 24 && hoursDiff > DateTime.now().hour) {
      date =
          '${widget.orderDate.hour.toString().padLeft(2, '0')}:${widget.orderDate.minute.toString().padLeft(2, '0')}';
    } else if (hoursDiff <= DateTime.now().hour && hoursDiff > 1) {
      date = '$hoursDiff ч назад';
    } else {
      date = '${nowDT.difference(widget.orderDate).inMinutes} мин назад';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
                  'images/nike3.png',
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
                      '№ 325556516',
                      style: theme.textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.darkBlue,
                          height: null),
                    ),
                    Text(
                      'Nike Air Max 270 Essential',
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
                            '\$364.95',
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: theme.colorScheme.black,
                              height: 20 / 14,
                            ),
                          ),
                          Text(
                            '\$260.00',
                            style: theme.textTheme.labelLarge?.copyWith(
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
    );
  }
}
