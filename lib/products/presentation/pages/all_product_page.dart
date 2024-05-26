import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mlk/Auth/presentation/widgets/custom_elevated_button.dart';
import 'package:mlk/products/data/datasources/product_remote_data_source.dart';
import 'package:mlk/products/domaine/entities/one_product.dart';
import 'package:mlk/products/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:mlk/products/presentation/pages/add_prduct_page.dart';
import 'package:mlk/products/presentation/pages/one_product_detail_page.dart';
import 'package:mlk/products/presentation/widget/search_delegate.dart';

class AllProductPage extends StatefulWidget {
  AllProductPage({super.key});

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  final SliverGridDelegate gridDelegate =
      SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 8.0, // spacing between rows
    crossAxisSpacing: 8.0,
  );
  @override
  void initState() {
    // TODO: implement initState
    context.read<ProductCubit>().getAllProduct();
  }

  Widget getPromotionAndVenteFlash(OneProduct oneProduct,
      List<OneProduct> venteFlash, List<OneProduct> promotions) {
    if (promotions.contains(oneProduct)) {
      return Positioned(
          right: 2,
          child: Container(
            color: Colors.red,
            child: Row(
              children: [
                Icon(Icons.discount),
                Text(
                  "${oneProduct.discountPercentage}%",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ));
    } else if (venteFlash.contains(oneProduct)) {
      return Positioned(
          right: 2,
          child: Container(
            child: Row(
              children: [
                Icon(
                  Icons.flash_on,
                  color: Colors.green,
                ),
                Text("flash")
              ],
            ),
          ));
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("All Products"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                var mulist =
                    await ProductRemoteDataSourceImpl().getAllProducts();
                showSearch(
                    context: context,
                    delegate: productSearchDelegate(list: mulist));
              },
              icon: Icon(Icons.search),
            )
          ],
        ),
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is GetAllProductSuccess) {
              return GridView.builder(
                itemCount: state.allPrducts.length,
                gridDelegate: gridDelegate,
                itemBuilder: (context, index) {
                  List<OneProduct> promotionProduct = state.allPrducts
                      .where((element) => element.price! > 50)
                      .toList();
                  List<OneProduct> venteFlashProduct = state.allPrducts
                      .where((element) => element.price! < 10)
                      .toList();

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OneProduDetailPage(
                                    productId: state.allPrducts[index].id,
                                  )));
                    },
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10.h),
                          height: 400,
                          width: 170,
                          decoration: BoxDecoration(),
                          child: Column(children: [
                            Container(
                                decoration: BoxDecoration(),
                                child: Container(
                                  height: 130,
                                  width: 170,
                                  child: ClipRRect(
                                    child: Image.network(
                                        state.allPrducts[index].thumbnail!,
                                        fit: BoxFit.cover),
                                  ),
                                )),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxWidth: 100, maxHeight: 20),
                                    child: Text(
                                      state.allPrducts[index].title!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  " \$${state.allPrducts[index].price.toString()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )
                          ]),
                        ),
                        getPromotionAndVenteFlash(state.allPrducts[index],
                            venteFlashProduct, promotionProduct)
                      ],
                    ),
                  );
                },
              );
            } else if (state is GetAllProductFailure) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is GetAllProductLoading) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ));
  }
}
