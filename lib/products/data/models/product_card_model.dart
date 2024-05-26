import 'package:mlk/products/domaine/entities/product_card.dart';

class productCardModel extends productCard {
  productCardModel(
      {required super.id, required super.price, required super.title});
  productCardModel.fromJson(Map<String, dynamic> json)
      : super(id: json['id'], price: json['price'], title: json['title']);
}
