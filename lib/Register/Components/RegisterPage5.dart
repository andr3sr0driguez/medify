import 'package:medify/Register/Models/TiposDocumentos.dart';
import 'package:medify/Register/Providers/GetData.dart';
import 'package:medify/Register/Providers/RegisrterController.dart';
import 'package:medify/src/utils/UI/widget/CustomTextForm/custom_form_field.dart';
import 'package:medify/src/utils/UI/widget/Select/models/select_item.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RegisterPage5 extends StatefulWidget {
  const RegisterPage5({super.key});

  @override
  State<RegisterPage5> createState() => _RegisterPage5State();
}

class _RegisterPage5State extends State<RegisterPage5> {
  Size? size;
  final TiposDocumentos? typosDocuments = null;

  List<SelectItem> listTypeDocuments = [];
  FocusNode code = FocusNode();

  GetData getData = GetData();

  @override
  void dispose() {
    if (mounted) {
      super.dispose();
    }
  }

  final registerProvider = Get.put(RegisterController());

  @override
  void initState() {
    super.initState();
    // getInitData();
  }

  @override
  Widget build(BuildContext context) {
    // print(registerProvider.Perfilfile.toString());
    size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text('Te hemos enviado un codigo de verificacion a tu correo'),
        CustomFormField(textController: registerProvider.code)
      ],
    );
  }

  launchWhatsAppString(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
  }
}
