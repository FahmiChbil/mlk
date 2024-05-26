part of 'product_cubit.dart';

sealed class ProductState {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

class GetAllProductLoading extends ProductState {
  GetAllProductLoading();
}

final class GetAllProductSuccess extends ProductState {
  final List<OneProduct> allPrducts;
  GetAllProductSuccess({required this.allPrducts});
}

final class GetAllProductFailure extends ProductState {
  final String error;
  GetAllProductFailure({required this.error});
}

class GetOneProductLoading extends ProductState {
  GetOneProductLoading();
}

class GetOneProductSucces extends ProductState {
  final OneProduct oneProduct;
  GetOneProductSucces({required this.oneProduct});
}

class GetOneProductFailure extends ProductState {
  final String error;
  GetOneProductFailure({required this.error});
}

class SearchState extends ProductState {
  final List<OneProduct> searchedList;
  SearchState({required this.searchedList});
}

class AddCartLoading extends ProductState {
  AddCartLoading();
}

class AddCartSuccess extends ProductState {
  final Cart productCartList;
  AddCartSuccess({required this.productCartList});
}

class AddCartFailure extends ProductState {
  final String error;
  AddCartFailure({required this.error});
}
