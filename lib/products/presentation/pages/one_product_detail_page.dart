import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mlk/Auth/presentation/widgets/custom_elevated_button.dart';
import 'package:mlk/core/const.dart';
import 'package:mlk/products/domaine/entities/product_card.dart';
import 'package:mlk/products/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:mlk/products/presentation/pages/cart_page.dart';

class OneProduDetailPage extends StatefulWidget {
  const OneProduDetailPage({super.key, required this.productId});
  final int? productId;

  @override
  State<OneProduDetailPage> createState() => _OneProduDetailPageState();
}

class _OneProduDetailPageState extends State<OneProduDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ProductCubit>().getOneProduct(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<ProductCubit>().getAllProduct();
                },
                icon: Icon(Icons.arrow_back)),
          ),
          body: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is GetOneProductSucces) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                            height: 250.h,
                            width: double.infinity,
                            child: Image.network(
                              state.oneProduct.thumbnail!,
                            )),
                      ],
                    ),
                    Positioned(
                        top: 270.h,
                        bottom: 0.1,
                        left: 0.00001,
                        right: 0.000001,
                        child: Container(
                          decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 30.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        state.oneProduct.title!,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp),
                                      ),
                                      Text(
                                        "\$${state.oneProduct.price.toString()}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "description: ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Container(
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxHeight: 80,
                                          ),
                                          child: Text(
                                            state.oneProduct.description!,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    width: 80.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "rate: ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.sp),
                                            ),
                                            Text(
                                              "${state.oneProduct.rating!}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.sp),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "stock: ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.sp),
                                            ),
                                            Text(
                                              "${state.oneProduct.stock!}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.sp),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "category: ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp),
                                      ),
                                      Text(
                                        "${state.oneProduct.category!}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "brand: ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp),
                                      ),
                                      Text(
                                        "${state.oneProduct.brand}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  BlocListener<ProductCubit, ProductState>(
                                    listener: (context, state2) {
                                      if (state2 is AddCartSuccess) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(customSnackBar(
                                                "prduit ajouté",
                                                Colors.green,
                                                Icons.check));
                                      } else if (state2 is AddCartFailure) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(customSnackBar(
                                                state2.error,
                                                Colors.red,
                                                Icons.error));
                                      }
                                    },
                                    child: Center(
                                      child: CustomElevatedButton(
                                          onpress: () {
                                            context
                                                .read<ProductCubit>()
                                                .addCart(1, state.oneProduct);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      CartPage(
                                                          prductId: state
                                                              .oneProduct.id),
                                                ));
                                          },
                                          buttonText: "ajouter a la carte"),
                                    ),
                                  )
                                ],
                              )),
                        ))
                  ],
                );
              } else if (state is GetOneProductFailure) {
                return Center(child: Text(state.error));
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }
}
