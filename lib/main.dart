import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medify/routes/routes_app.dart';
import 'package:medify/src/Provider/PeticionesHttpProvider.dart';
import 'package:medify/src/Provider/PreferenciasUsuario.dart';
import 'package:medify/view/home_view.dart';
import 'package:medify/view/login_view.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenciasUsuario().initPrefs();
  runApp(const Medify());
}

class Medify extends StatelessWidget {
  const Medify({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: GetMaterialApp(
        theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
        routes: Routes.routes,
        // initialRoute: pref.islogin? Home.routeName : LoginView.routeName ,
        initialRoute: Home.routeName  ,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
