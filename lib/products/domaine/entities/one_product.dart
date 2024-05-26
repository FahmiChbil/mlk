import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class OneProduct extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final num? price;
  final num? discountPercentage;
  final num? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final List<String>? images;
  final String? thumbnail;

  OneProduct(
      {required this.id,
      required this.tags,
      required this.title,
      required this.brand,
      required this.category,
      required this.description,
      required this.discountPercentage,
      required this.images,
      required this.price,
      required this.rating,
      required this.stock,
      required this.thumbnail});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        tags,
        title,
        brand,
        category,
        description,
        discountPercentage,
        images,
        price,
        rating,
        stock,
        thumbnail
      ];
}
