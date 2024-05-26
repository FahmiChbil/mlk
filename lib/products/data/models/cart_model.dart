import 'package:mlk/products/data/models/product_card_model.dart';
import 'package:mlk/products/data/models/product_model.dart';
import 'package:mlk/products/domaine/entities/card.dart';

class CartModel extends Cart {
  CartModel({required super.id, required super.productsCard});

  CartModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          productsCard: List.from(json['products'])
              .map((e) => productCardModel.fromJson(e))
              .toList(),
        );
}
