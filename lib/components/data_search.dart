import 'package:flutter/material.dart';
import 'package:qatra_app/models/Mosque.dart';
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

     BottomSheets().getBottom(context, []);
    // Navigator.pop(context);
    // return BottomSheets();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? hestory
        : mosqueList.where((element) => element.name.contains(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: (){
            showResults(context);
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
    );
  }
}
