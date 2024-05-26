import 'package:dartz/dartz.dart';
import 'package:mlk/core/error/failures.dart';
import 'package:mlk/products/domaine/entities/card.dart';
import 'package:mlk/products/domaine/entities/one_product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<OneProduct>>> getAllProducts();
  Future<Either<Failure, OneProduct>> getOneproduct(int? id);
  Future<Either<Failure, Cart>> addCart(
      int? userId, OneProduct productCartList);
}
