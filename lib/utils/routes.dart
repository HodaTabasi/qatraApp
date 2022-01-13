import 'package:flutter/widgets.dart';
import 'package:qatra_app/screens/confirm_orders/ConfirmOrders.dart';
import 'package:qatra_app/screens/confirm_orders/ConfirmOrders1.dart';
import 'package:qatra_app/screens/extra/extea.dart';
import 'package:qatra_app/screens/forget_password/forget_pass.dart';
import 'package:qatra_app/screens/home/gmap.dart';
import 'package:qatra_app/screens/home/main_one.dart';
import 'package:qatra_app/screens/login/loginbyemail_screen.dart';
import 'package:qatra_app/screens/login/loginbyphone_screen.dart';
import 'package:qatra_app/screens/newuser/new_user.dart';
import 'package:qatra_app/screens/onboarding/introduction_screen.dart';
import 'package:qatra_app/screens/order/order_screen.dart';
import 'package:qatra_app/screens/otp/otp_screen.dart';
import 'package:qatra_app/screens/payment/Payment.dart';
import 'package:qatra_app/screens/product_page/product_screen.dart';
import 'package:qatra_app/screens/profile/profile_screen.dart';
import 'package:qatra_app/screens/select_card/selectpayment.dart';
import 'package:qatra_app/screens/select_forget_screen/chooser_way.dart';
import 'package:qatra_app/screens/side_menu/side_menu_screen.dart';
import 'package:qatra_app/screens/splash.dart';
import 'package:qatra_app/screens/web_view/WebViewPage.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  Splash.routeName: (context) => Splash(),
  IntroScreen.routeName: (context) => IntroScreen(),
  Login.routeName: (context) => Login(),
  OtpScreen.routeName: (context) => OtpScreen(),
  LoginEmail.routeName: (context) => LoginEmail(),
  NewUser.routeName: (context) => NewUser(),
  ForgetPassword.routeName: (context) => ForgetPassword(),
  ProductScreen.routeName: (context) => ProductScreen(),
  GMap.routeName: (context) => GMap(),
  ConfirmOrders.routeName: (context) => ConfirmOrders(),
  ConfirmOrders1.routeName: (context) => ConfirmOrders1(),
  SelectCard.routeName: (context) => SelectCard(),
  Payment.routeName: (context) => Payment(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  OrderScreen.routeName: (context) => OrderScreen(),
  SideMenuScreen.routeName: (context) => SideMenuScreen(),
  MainZoom.routeName: (context) => MainZoom(),
  Extra.routeName: (context) => Extra(),
  ChosserWayReset.routeName: (context) => ChosserWayReset(),
  WebViewPage.routeName: (context) => WebViewPage(),
};
