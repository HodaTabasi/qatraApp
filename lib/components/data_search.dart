import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/helper/http_service.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/models/Mosque.dart';
import 'package:qatra_app/models/ProductsResponse.dart';
import 'package:qatra_app/models/SearchResponse.dart';
import 'package:qatra_app/screens/home/components/bottom_sheet.dart';
import 'package:qatra_app/utils/constant.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class DataSearch extends SearchDelegate<Mosque> {
  final hestory = [Mosque(name: "ابحث في النقاط الموجودة")];
  var token = null;
  bool isSearch = false;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      InkWell(
        onTap: () {
          if (query.isEmpty) {
            addToastMessage(
                error: "اكتب اسم الجامع حتي يتم البحث عنه في جوجل ماب",
                type: false);
          } else {
            FocusScope.of(context).requestFocus(FocusNode());
            getData(context);
          }
        },
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.blue.shade400,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Text(
              "المزيد",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
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
        ? mosqueList
        : mosqueList.where((element) => element.name.contains(query)).toList();
    return Stack(children: [
      ListView.builder(
        itemBuilder: (context, index) {
          if (index == suggestionList.length - 1 && isSearch) {
            getData(context);
            // return Center(child: CircularProgressIndicator());
          }
          return ListTile(
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());

              Provider.of<MainProvider>(context, listen: false).mosqueId =
                  suggestionList[index].id;
              // showResults(context);
              Provider.of<MainProvider>(context, listen: false)
                  .changeIsLoading(true);
              products productsResponse =
                  await HttpService.apiHelper.getProducts();
              if (productsResponse.status) {
                // setState(() {
                //   isLoading = false;
                // });
                Provider.of<MainProvider>(context, listen: false)
                    .changeIsLoading(false);
                BottomSheets().getBottom(context, productsResponse.data);
              } else {
                addToastMessage(
                    error: productsResponse.message[0], type: false);
                Provider.of<MainProvider>(context, listen: false)
                    .changeIsLoading(false);
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
            subtitle: Text(suggestionList[index].address ?? ""),
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
          : Center()
    ]);
  }

  void getData(context) async {
    isSearch = true;
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: ' يتم الان تحميل النقاط من خريطة جوجل');
    SearchResponse myjson = await HttpService.apiHelper
        .getMosqueSearch(query, "googleMap", nextPageToken: token);
    pd.close();
    if (myjson.status) {
      isSearch = false;
      mosqueList.addAll(myjson.data.mosques);
      if (myjson.data.token != null) {
        token = myjson.data.token;
      } else {
        token = null;
        isSearch = false;
      }
    } else {
      addToastMessage(error: myjson.message[0], type: false);
    }
  }
}
