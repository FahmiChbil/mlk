import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mlk/products/data/datasources/product_remote_data_source.dart';
import 'package:mlk/products/domaine/entities/one_product.dart';
import 'package:mlk/products/presentation/pages/one_product_detail_page.dart';

class productSearchDelegate extends SearchDelegate {
  final SliverGridDelegate gridDelegate =
      SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 8.0, // spacing between rows
    crossAxisSpacing: 8.0,
  );
  productSearchDelegate({required this.list});

  final List<OneProduct> list;
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

  List<OneProduct> listofProduct = [];
  List<OneProduct> newList = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close)),
      IconButton(
          onPressed: () async {
            showResults(context);
          },
          icon: const Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.navigate_before));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<OneProduct> newList = query.isEmpty
        ? list
        : list.where((element) {
            return element.title!.toLowerCase().contains(query.toLowerCase()) ||
                element.price!
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase());
          }).toList();
    return GridView.builder(
      itemCount: newList.length,
      gridDelegate: gridDelegate,
      itemBuilder: (context, index) {
        List<OneProduct> promotionProduct =
            listofProduct.where((element) => element.price! > 50).toList();
        List<OneProduct> venteFlashProduct =
            listofProduct.where((element) => element.price! < 10).toList();

        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OneProduDetailPage(
                          productId: listofProduct[index].id,
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
                          child: Image.network(newList[index].thumbnail!,
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
                          constraints:
                              BoxConstraints(maxWidth: 100, maxHeight: 20),
                          child: Text(
                            newList[index].title!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        " \$${newList[index].price.toString()}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ]),
              ),
              getPromotionAndVenteFlash(
                  newList[index], venteFlashProduct, promotionProduct)
            ],
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<OneProduct> newList = query.isEmpty
        ? list
        : list.where((element) {
            return element.title!.toLowerCase().contains(query.toLowerCase()) ||
                element.price!
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase());
          }).toList();
    return GridView.builder(
      itemCount: newList.length,
      gridDelegate: gridDelegate,
      itemBuilder: (context, index) {
        List<OneProduct> promotionProduct =
            listofProduct.where((element) => element.price! > 50).toList();
        List<OneProduct> venteFlashProduct =
            listofProduct.where((element) => element.price! < 10).toList();

        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OneProduDetailPage(
                          productId: newList[index].id,
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
                          child: Image.network(newList[index].thumbnail!,
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
                          constraints:
                              BoxConstraints(maxWidth: 100, maxHeight: 20),
                          child: Text(
                            newList[index].title!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        " \$${newList[index].price.toString()}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ]),
              ),
              getPromotionAndVenteFlash(
                  newList[index], venteFlashProduct, promotionProduct)
            ],
          ),
        );
      },
    );
  }
}
