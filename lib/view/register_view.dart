import 'package:flutter/material.dart';
import 'package:medify/widget/button_box.dart';
import 'package:medify/widget/input_text_form.dart';

class RegisterView extends StatefulWidget {
  static String routeName = 'register';
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController tipoIdentificacionController = TextEditingController();
  TextEditingController documentoIdentificacionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: bodyRegister(),
    );
  }

  Widget bodyRegister() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 50),
            Center(
              child: Image.asset(
                'assets/logo_medify.png',
                width: 250,
              ),
            ),
            InputTextForm(
              placeholder: 'Nombre',
              textController: nombreController,
            ),
            InputTextForm(
              placeholder: 'Apellido',
              textController: apellidoController,
            ),
            InputTextForm(
              placeholder: 'Tipo Identificacion',
              textController: tipoIdentificacionController,
            ),
            InputTextForm(
              placeholder: 'Numero Identificacion',
              textController: documentoIdentificacionController,
            ),
            CustomButton(
              textButton: 'Siguiente',
              onPressed: () {
                print(nombreController.text);
              },
            ),
            const Padding(
              padding: const EdgeInsets.only(top: 20),
              child: InkWell(
                child: Text('Iniciar sesion'),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
