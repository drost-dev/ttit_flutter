import 'package:equatable/equatable.dart';

enum Features {
  bestSeller,
}

class Product extends Equatable {
  const Product({
    required this.id,
    required this.name,
    required this.price,
    this.feature,
    required this.imagePath,
  });

  final int id;
  final String name;
  final double price;
  final Features? feature;
  final String imagePath;

  @override
  List<Object?> get props => [name, price, feature, imagePath];
}
