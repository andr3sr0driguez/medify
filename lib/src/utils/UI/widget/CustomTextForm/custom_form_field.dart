import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:set_plus_app/src/Config/GobalStyle.dart';

class CustomFormField extends StatefulWidget {
  TextEditingController textController;
  FocusNode? focusNode;
  String? hintext = "";
  String? lavelText = "";
  Function(String)? onChanged;
  BoxDecoration? decoration;
  String? initialValue = '';
  bool? readOnly = false;
  bool? obscureText = false;
  String? Function(String?)? validator;
  String? Function(String?)? onFieldSubmitted;
  Icon? icon;
  TextInputType? textInputType;
  List<TextInputFormatter>? inputFormatters;
  double? width;

  CustomFormField(
      {required this.textController,
      this.focusNode,
      this.hintext,
      this.lavelText,
      this.onChanged,
      this.decoration,
      this.initialValue,
      this.readOnly,
      this.obscureText,
      this.validator,
      this.icon,
      this.textInputType,
      this.onFieldSubmitted,
      this.inputFormatters,
      this.width});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _obscureText = false;
  bool init = true;
  @override
  Widget build(BuildContext context) {
    if (init) {
      _obscureText = widget.obscureText ?? false;
      init = false;
    }

    return Container(
      width: widget.width,
      decoration: widget.decoration,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromARGB(255, 58, 59, 60),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      //  blurRadius:  1,
                      //  spreadRadius: 9,
                      offset: Offset(0, 2),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                child: TextFormField(
                  inputFormatters: widget.inputFormatters,
                  onFieldSubmitted: widget.onFieldSubmitted,
                  keyboardType: widget.textInputType,
                  obscureText: _obscureText,
                  readOnly: widget.readOnly ?? false,
                  focusNode: widget.focusNode,
                  controller: widget.textController,
                  onChanged: widget.onChanged,
                  decoration: InputDecoration(
                      suffixIcon: widget.obscureText == true
                          ? GestureDetector(
                              onTap: () {
                                if (this.mounted)
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                              },
                              child: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )
                          : null,
                      border: InputBorder.none,
                      hintText: widget.hintext,
                      labelText: widget.lavelText,
                      icon: widget.icon != null ? widget.icon : null),
                  validator: widget.validator,
                  // textAlign: TextAlign.,
                  initialValue: widget.initialValue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
