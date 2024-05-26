import 'package:dartz/dartz.dart';
import 'package:mlk/core/error/failures.dart';
import 'package:mlk/products/domaine/entities/card.dart';
import 'package:mlk/products/domaine/entities/one_product.dart';
import 'package:mlk/products/domaine/repositories/product_repository.dart';

class AddCartUseCase {
  ProductRepository productRepository;
  AddCartUseCase(this.productRepository);
  Future<Either<Failure, Cart>> call(
      int? userId, OneProduct productCartList) async {
    return productRepository.addCart(userId, productCartList);
  }
}
