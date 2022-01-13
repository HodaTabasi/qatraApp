import 'package:flutter/material.dart';
import 'package:qatra_app/components/order_item.dart';
import 'package:qatra_app/screens/product_page/components/item_product.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class ProductScreen extends StatefulWidget {
  static String routeName = "/product_screen";

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showSlidingBottomSheet(context, builder: (context) {
              return SlidingSheetDialog(
                cornerRadius: 16,
                avoidStatusBar: true,
                snapSpec: const SnapSpec(
                  // Enable snapping. This is true by default.
                  // Set custom snapping points.
                  initialSnap: 0.7,
                  snappings: [0.4, 0.7,1],
                  // Define to what the snappings relate to. In this case,
                  // the total available space that the sheet can expand to.
                  positioning: SnapPositioning.relativeToSheetHeight,
                ),
                builder: (context, state) {
                  // This is the content of the sheet that will get
                  // scrolled, if the content is bigger than the available
                  // height of the sheet.
                  return Container(
                    height: 500,
                    child: Center(
                      child: Text('This is the content of the sheet'),
                    ),
                  );
                },
              );
            });
          },
          child: Text("gggggggggggg"),
        ),
      ),
    );
  }
}
