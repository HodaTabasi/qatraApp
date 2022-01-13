import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class FlagItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            VerticalDivider(),
          ],
        ),
      ),
    );
  }
}
