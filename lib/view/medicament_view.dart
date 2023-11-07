
import 'package:flutter/material.dart';

class Medicament extends StatefulWidget {
  const Medicament({super.key});
  static String routeName = 'medicamentos';

  @override
  State<Medicament> createState() => _MedicamentState();
}

class _MedicamentState extends State<Medicament> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(),);
  }
}