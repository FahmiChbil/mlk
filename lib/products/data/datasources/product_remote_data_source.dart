import 'dart:convert';

import 'package:mlk/core/error/exception.dart';
import 'package:mlk/products/data/models/cart_model.dart';
import 'package:mlk/products/data/models/product_model.dart';
import 'package:mlk/products/domaine/entities/card.dart';
import 'package:mlk/products/domaine/entities/one_product.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  Future<List<OneProduct>> getAllProducts();
  Future<OneProduct> getOneProduct(int? id);
  Future<Cart> addCart(int userId, OneProduct productCartList);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  @override
  Future<List<OneProduct>> getAllProducts() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    var result = jsonDecode(response.body)['products'];

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      print("data loaded successssfuly ===========");
      return List<OneProduct>.from(
          result.map((x) => OneProductModel.fromJson(x)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw ServerException();
    }
  }

  @override
  Future<OneProduct> getOneProduct(int? id) async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products/$id'));

    var result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      print("one product loaded successssfuly ===========");
      return OneProductModel.fromJson(result);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw ServerException();
    }
  }

  @override
  Future<Cart> addCart(int? userId, OneProduct productCartList) async {
    final response =
        await http.post(Uri.parse('https://dummyjson.com/carts/add'),
            headers: <String, String>{'Content-Type': 'application/json'},
            body: jsonEncode(<String, dynamic>{
              'userId': userId,
              'products': [
                {
                  "id": productCartList.id,
                  "quantity": 1,
                }
              ],
            }));
    if (response.statusCode == 200) {
      return CartModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
