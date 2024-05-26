import 'package:dartz/dartz.dart';
import 'package:mlk/core/error/failures.dart';
import 'package:mlk/products/domaine/entities/one_product.dart';
import 'package:mlk/products/domaine/repositories/product_repository.dart';

class GetOneProductUseCase {
  final ProductRepository productRepository;

  GetOneProductUseCase(this.productRepository);

  Future<Either<Failure, OneProduct>> call(int? id) async {
    return await productRepository.getOneproduct(id);
  }
}
