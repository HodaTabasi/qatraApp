import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/helper/http_service.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/models/Mosque.dart';
import 'package:qatra_app/models/ProductsResponse.dart';
import 'package:qatra_app/screens/home/components/bottom_sheet.dart';
import 'package:qatra_app/utils/constant.dart';

class DataSearch extends SearchDelegate<Mosque> {


  final hestory = [Mosque(name: "لا يوجد بيانات")];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      InkWell(
        onTap: () {},
        child: Center(
          child: Text(
            "المزيد",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // Navigator.pop(context);
    // return BottomSheets();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? hestory
        : mosqueList.where((element) => element.name.contains(query)).toList();
    return Stack(
      children: [ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());

              Provider.of<MainProvider>(context, listen: false).mosqueId =
                  suggestionList[index].id;
              // showResults(context);
              Provider.of<MainProvider>(context, listen: false).changeIsLoading(true);
              products productsResponse =
              await HttpService.apiHelper.getProducts();
              if (productsResponse.status) {
                // setState(() {
                //   isLoading = false;
                // });
                Provider.of<MainProvider>(context, listen: false).changeIsLoading(false);
                BottomSheets().getBottom(context, productsResponse.data);
              } else {
                addToastMessage(
                    error: productsResponse.message[0], type: false);
                Provider.of<MainProvider>(context, listen: false).changeIsLoading(false);
                // setState(() {
                //   isLoading = false;
                // });
              }
            },
            leading: Icon(Icons.location_city),
            title: RichText(
              text: TextSpan(
                  text: suggestionList[index].name.substring(0, query.length),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: suggestionList[index].name.substring(query.length),
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ]),
            ),
            subtitle: Text(suggestionList[index].address??""),
          );
        },
        itemCount: suggestionList.length,
      ),
        Provider.of<MainProvider>(context).isLoading
            ? Align(
          alignment: Alignment.center,
          child: Container(
            color: Colors.black.withOpacity(0.4),
            child: SpinKitPouringHourGlassRefined(
              color: Color(0xff00DAFD),
              size: 50.0,
            ),
          ),
        )
            : Center()]
    );
  }
}
