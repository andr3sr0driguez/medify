import 'dart:io';
import 'package:http/http.dart';
import 'package:medify/src/utils/UI/widget/global_widgets.dart';
// import '../../../../../../lib_old/src/utils/UI/widget/global_widgets.dart';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
// import 'package:set_plus_app/src/Config/GobalStyle.dart';
// import 'package:set_plus_app/src/utils/UI/widget/global_widgets.dart';

class LoadProfile extends StatefulWidget {
  //  LoadProfile({super.key,});

  String? label;
  Function(PickedFile? file)? onChanged;
  PickedFile? file;

  LoadProfile({this.label, this.onChanged, required this.file});

  @override
  State<LoadProfile> createState() => _LoadProfileState();
}

class _LoadProfileState extends State<LoadProfile> {
  // PickedFile? widget.file;

  @override
  Widget build(BuildContext context) {
    return crearImagen(context);
  }

  Widget crearImagen(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
            onTap: () {
              onpressaddImage(context);
            },
            child: Center(
              child: Container(
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, offset: Offset(0, 2))
                      ],
                      color: Color.fromARGB(255, 58, 59, 60),
                      borderRadius: BorderRadius.circular(100)),
                  width: 140,
                  height: 140,
                  child: widget.file != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                              fit: BoxFit.cover,
                              image: FileImage(File(widget.file!.path))),
                        )
                      : Center(
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                            ),
                            Text(
                              widget.label == null
                                  ? "Cargar Imagen"
                                  : widget.label.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ))),
            )),
        widget.file != null
            ? Center(
                child: IconButton(
                    alignment: Alignment.center,
                    // iconSize: ,
                    icon: IconButton(
                      icon: const Icon(
                        Icons.highlight_remove_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (this.mounted)
                          setState(() {
                            widget.file = null;

                            if (widget.onChanged != null) {
                              widget.onChanged!(null);
                            }
                          });

                        // if( widget.onChanged != null){
                        //  widget.onChanged!()!;
                        // }
                      },
                    ),
                    onPressed: null),
              )
            : Container(),
      ],
    );
  }

  void onpressaddImage(BuildContext context) {
    alerta(
      context,
      titulo: "Select",
      code: true,
      contenido: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.center_focus_strong,
                      color: Colors.white,
                      size: 18,
                    ),
                    Text(
                      'Take',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                onPressed: () {
                  cargarImageCamera();
                  Navigator.pop(context);
                }),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add_photo_alternate,
                      color: Colors.white,
                      size: 18,
                    ),
                    const Text(
                      'Galery',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                onPressed: () {
                  cargarImageGalery();
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }

  Future cargarImageGalery() async {
    PickedFile? tempImage = await ImagePicker.platform
        .pickImage(maxHeight: 480, maxWidth: 640, source: ImageSource.gallery);

    if (tempImage != null) {
      if (this.mounted) {
        setState(() {
          widget.file = PickedFile(tempImage.path);

          if (widget.onChanged != null) {
            widget.onChanged!(tempImage);
          }
        });
      }
    }
  }

  Future cargarImageCamera() async {
    PickedFile? tempImageCamera = await ImagePicker.platform
        .pickImage(source: ImageSource.camera, maxHeight: 480, maxWidth: 640);

    if (tempImageCamera != null) {
      if (this.mounted) {
        setState(() {
          widget.file = PickedFile(tempImageCamera.path);

          if (widget.onChanged != null) {
            widget.onChanged!(tempImageCamera);
          }
        });
      }
    }
  }
}
