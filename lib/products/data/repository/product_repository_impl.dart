import 'package:dartz/dartz.dart';
import 'package:mlk/core/error/exception.dart';
import 'package:mlk/core/error/failures.dart';
import 'package:mlk/products/data/datasources/product_remote_data_source.dart';
import 'package:mlk/products/domaine/entities/card.dart';
import 'package:mlk/products/domaine/entities/one_product.dart';
import 'package:mlk/products/domaine/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRemoteDataSourceImpl productRemoteDataSourceImpl;

  ProductRepositoryImpl({required this.productRemoteDataSourceImpl});
  @override
  Future<Either<Failure, List<OneProduct>>> getAllProducts() async {
    try {
      final data = await productRemoteDataSourceImpl.getAllProducts();

      return right(data);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OneProduct>> getOneproduct(int? id) async {
    try {
      final data = await productRemoteDataSourceImpl.getOneProduct(id);

      return right(data);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Cart>> addCart(
      int? userId, OneProduct productCartList) async {
    try {
      final data =
          await productRemoteDataSourceImpl.addCart(userId, productCartList);

      return right(data);
    } on ServerException {
      return left(ServerFailure());
    }
  }
}
