import 'package:flutter/material.dart';

class FloatButtomItem extends StatelessWidget {
  String image;
  int value;
  int groupValue;
  ValueChanged onChanged;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(value);
        // NavigationService.navigationService
        //     .navigateTo(ProfileScreen.routeName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        margin: const EdgeInsets.only(left: 80.0),
        child: Image.asset(image),
      ),
    );
  }
}
