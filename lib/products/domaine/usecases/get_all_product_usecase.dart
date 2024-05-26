import 'package:dartz/dartz.dart';
import 'package:mlk/core/error/failures.dart';
import 'package:mlk/products/domaine/entities/one_product.dart';
import 'package:mlk/products/domaine/repositories/product_repository.dart';

class GetAllProductUseCase {
  final ProductRepository productRepository;

  GetAllProductUseCase(this.productRepository);

  Future<Either<Failure, List<OneProduct>>> call() async {
    return await productRepository.getAllProducts();
  }
}
