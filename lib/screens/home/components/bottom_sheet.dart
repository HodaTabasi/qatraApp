import 'package:flutter/material.dart';
import 'package:qatra_app/models/Product.dart';
import 'package:qatra_app/screens/product_page/components/item_product.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class BottomSheets extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
  void getBottom(context, List<Product> data){
    showSlidingBottomSheet(
      context,
      builder: (context) {
        return SlidingSheetDialog(
            cornerRadius: 20,
            builder: (context, x) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Material(
                  child: GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 220,
                          crossAxisSpacing: 5),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductItem(
                          product: data[index],
                          image: 'assets/product.png',
                          title: "title",
                          price: 2000,
                          country: "country",
                        );
                      }),
                ),
              );
            });
      },
    );
  }
}
