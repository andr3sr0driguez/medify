import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});
  static String routeName = 'perfil';

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),);
  }
}