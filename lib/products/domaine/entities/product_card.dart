import 'package:equatable/equatable.dart';

class productCard extends Equatable {
  final int? id;
  final String? title;
  final num? price;

  productCard({required this.id, required this.price, required this.title});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
