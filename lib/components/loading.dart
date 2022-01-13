import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        color: Colors.black.withOpacity(0.4),
        child: SpinKitPouringHourGlassRefined(
          color: Color(0xff00DAFD),
          size: 50.0,
        ),
      ),
    );

    //   Center(
    //   child: CircularProgressIndicator(
    //     semanticsLabel: 'Linear progress indicator',
    //   ),
    // );
  }
}
