import 'package:flutter/material.dart';

class OnBoardProvider extends ChangeNotifier{
  int activePage = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

}