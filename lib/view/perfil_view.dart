import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medify/src/utils/UI/widget/LoadImages/LoadProfile.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});
  static String routeName = 'perfil';

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  PickedFile? photo;
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor:Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.reorder, size: 50,))],
        ),
        body: Column(children: [ LoadProfile(
                          file: photo,
                          label: "Foto de perfil",
                          onChanged: (PickedFile? file) {
                            photo = file;
                          },
                        ),]) ,
        );
  }
}