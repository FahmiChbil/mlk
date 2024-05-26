import 'package:mlk/products/domaine/entities/one_product.dart';

class OneProductModel extends OneProduct {
  OneProductModel(
      {required super.id,
      required super.tags,
      required super.title,
      required super.brand,
      required super.category,
      required super.description,
      required super.discountPercentage,
      required super.images,
      required super.price,
      required super.rating,
      required super.stock,
      required super.thumbnail});

  factory OneProductModel.fromJson(Map<String, dynamic> json) {
    return OneProductModel(
        id: json['id'],
        tags: List.from(json['tags']),
        title: json['title'],
        brand: json['brand'],
        category: json['category'],
        description: json['description'],
        discountPercentage: json['discountPercentage'],
        images: List.from(json['images']),
        price: json['price'],
        rating: json['rating'],
        stock: json['stock'],
        thumbnail: json['thumbnail']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tags': tags,
      'title': title,
      'brand': brand,
      'category': category,
      'description': description,
      'discountPercentage': discountPercentage,
      'images': images,
      'price': price,
      'rating': rating,
      'stock': stock,
      'thumbnail': thumbnail
    };
  }
}
