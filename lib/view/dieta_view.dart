import 'package:flutter/material.dart';


class Dieta extends StatefulWidget {
  const Dieta({super.key});
  static String routeNmae= 'dietas';

  @override
  State<Dieta> createState() => DietaState();
}

class DietaState extends State<Dieta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),);
  }
}