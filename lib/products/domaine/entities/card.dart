import 'package:equatable/equatable.dart';
import 'package:mlk/products/domaine/entities/one_product.dart';
import 'package:mlk/products/domaine/entities/product_card.dart';

class Cart extends Equatable {
  final int? id;
  final List<productCard> productsCard;

  Cart({required this.id, required this.productsCard});

  @override
  // TODO: implement props
  List<Object?> get props => [id, productsCard];
}
