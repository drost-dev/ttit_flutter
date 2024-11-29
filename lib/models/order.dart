import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/product.dart';

class Order extends Equatable {
    const Order({
    required this.id,
    required this.product,
    required this.totalPrice,
    required this.price,
    required this.orderDate
  });

  final int id;
  final Product product;
  final double totalPrice;
  final double price;
  final DateTime orderDate;

  @override
  List<Object?> get props => [id, product, totalPrice, price, orderDate];
}
