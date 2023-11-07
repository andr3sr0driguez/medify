





import 'package:flutter/material.dart';
import 'package:medify/Register/RegisterPage.dart';
import 'package:medify/view/dieta_view.dart';
import 'package:medify/view/home_view.dart';
import 'package:medify/view/medicament_view.dart';
import 'package:medify/view/perfil_view.dart';
import 'package:medify/view/register_view.dart';
import 'package:medify/view/login_view.dart';
import 'package:medify/view/sueno_view.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    LoginView.routeName: (context) => LoginView(),
    RegisterView.routeName: (context) => Register(),
    Home.routeName: (context) => Home(),
    Medicament.routeName : (contex) => Medicament(),
    Dieta.routeNmae : (context) => Dieta(),
    sueno.routeName : (context)=> sueno(),
    Perfil.routeName : (context)=> Perfil(),
   };
}
