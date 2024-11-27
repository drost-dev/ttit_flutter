import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum Features {
  bestSeller,
}

class ProductCard extends Equatable {
  const ProductCard({
    required this.id,
    required this.name,
    required this.price,
    this.feature,
    required this.image,
  });

  final int id;
  final String name;
  final double price;
  final Features? feature;
  final Image image;

  @override
  List<Object?> get props => [name, price, feature, image];
}
