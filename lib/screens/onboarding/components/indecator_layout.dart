import 'package:flutter/material.dart';
import 'package:qatra_app/models/item.dart';

class IndecatorLayout extends StatelessWidget {
  int activePage;

  IndecatorLayout(this.activePage);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(ItemBoard.pageInfos.length, (index){
          return Container(
            width: activePage == index ?15:5,
            height: 5,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: activePage == index?
              const Color(0xFFAFAFAF):
              const Color(0xFF707070),
              borderRadius: BorderRadius.circular(5),
            ),
          );
        }),
      ),
    );
  }
}
