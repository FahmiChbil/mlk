import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mlk/core/const.dart';
import 'package:mlk/products/domaine/entities/card.dart';
import 'package:mlk/products/domaine/entities/one_product.dart';
import 'package:mlk/products/domaine/usecases/add_to_card_usecase.dart';
import 'package:mlk/products/domaine/usecases/get_all_product_usecase.dart';
import 'package:mlk/products/domaine/usecases/get_one_product_use_case.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  GetAllProductUseCase getAllProductUseCase;
  GetOneProductUseCase getOneProductUseCase;
  AddCartUseCase addCartUseCase;
  ProductCubit(
      {required this.getAllProductUseCase,
      required this.getOneProductUseCase,
      required this.addCartUseCase})
      : super(ProductInitial());

  getAllProduct() async {
    final result = await getAllProductUseCase();

    result.fold(
        (l) => emit(GetAllProductFailure(error: SERVER_FAILURE_MESSAGE)),
        (r) => emit(GetAllProductSuccess(allPrducts: r)));
  }

  getOneProduct(int? id) async {
    final result = await getOneProductUseCase(id);

    result.fold(
        (l) => emit(GetOneProductFailure(error: SERVER_FAILURE_MESSAGE)),
        (r) => emit(GetOneProductSucces(oneProduct: r)));
  }

  addCart(int? userId, OneProduct oneproduct) async {
    emit(AddCartLoading());
    final result = await addCartUseCase(userId, oneproduct);
    result.fold((l) => emit(AddCartFailure(error: SERVER_FAILURE_MESSAGE)),
        (r) => emit(AddCartSuccess(productCartList: r)));
  }
}
