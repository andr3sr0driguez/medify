import 'package:medify/Register/Components/RegisterPage1.dart';
import 'package:medify/Register/Components/RegisterPage4.dart';
import 'package:medify/Register/Components/RegisterPage5.dart';

import 'package:medify/Register/Providers/RegisrterController.dart';
import 'package:medify/src/Provider/PreferenciasUsuario.dart';
import 'package:medify/src/utils/UI/widget/ButtomCustom/ButtomCustom.dart';
import 'package:medify/src/utils/UI/widget/Select/models/select_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  static const String routeName = "Register";
  final RegisterProvider = Get.put(RegisterController());

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Size? size;

  @override
  void initState() {
    super.initState();
    final RegisterProvider = Get.find<RegisterController>();

    RegisterProvider.curentPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    PreferenciasUsuario pref = PreferenciasUsuario();

    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
              Get.delete<RegisterController>();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _indicator(0),
            _indicator(1),
            _indicator(2),
            // _indicator(4),
            SizedBox(
              width: 60,
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    curve: Curves.ease,
                    duration: Duration(milliseconds: 600),
                    // color: Colors.amber,
                    height: size!.height - 170,

                    child: PageView(
                        onPageChanged: (v) {
                          if (v > widget.RegisterProvider.curentPage) {
                            bool valid = widget.RegisterProvider.validateForm(
                                v - 1, context);
                            print(v);
                            if (valid) {
                              widget.RegisterProvider.curentPage = v;
                            }
                          } else {
                            widget.RegisterProvider.curentPage = v;
                          }

                          // print(widget.RegisterProvider.curentPage.toString());
                          if (this.mounted) {
                            setState(() {});
                          }
                        },
                        controller: widget.RegisterProvider.pageController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            // color: Colors.transparent,
                            child: RegisterPage1(),
                          ),
                          Container(
                            // color: Colors.black,
                            child: RegisterPage4(),
                          ),
                          Container(
                            // color: Colors.black,
                            child: RegisterPage5(),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _back(),
                      ),
                      Expanded(
                        flex: 2,
                        child: _next(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _indicator(int page) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutQuart,
        width: widget.RegisterProvider.curentPage == page ? 15 : 10,
        height: widget.RegisterProvider.curentPage == page ? 15 : 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: widget.RegisterProvider.curentPage == page
              ? Colors.white
              : Colors.black12,
        ),
      ),
    );
  }

  _next() {
    String label = "Siguiente";

    if (widget.RegisterProvider.curentPage == 4) {
      label = "Terminar";
    }
    return Container(
        child: BotomSendWidget(
      colorButtom: Color.fromARGB(255, 18, 121, 255),
      colorShadow: Colors.white,
      onTap: () {
        widget.RegisterProvider.nextPage();
        // setState(() {
        // });
      },
      textButtom: label,
    ));
  }

  _back() {
    return Container(
        child: BotomSendWidget(
      colorButtom: Color.fromARGB(255, 58, 59, 60),
      colorShadow: Colors.transparent,
      onTap: () {
        widget.RegisterProvider.backPage();
      },
      textButtom: "Atras",
    ));
  }
}
