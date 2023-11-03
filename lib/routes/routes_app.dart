import 'package:flutter/material.dart';
import 'package:medify/Register/RegisterPage.dart';
import 'package:medify/view/home_view.dart';
import 'package:medify/view/register_view.dart';
import 'package:medify/view/login_view.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    LoginView.routeName: (context) => LoginView(),
    RegisterView.routeName: (context) => Register(),
    Home.routeName: (context) => Home(),
  };
}
