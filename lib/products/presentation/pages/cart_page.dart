import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlk/products/presentation/cubit/product_cubit/product_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, required this.prductId});
  static String id = "card";
  final int? prductId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.read<ProductCubit>().getOneProduct(prductId);
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
    );
  }
}
