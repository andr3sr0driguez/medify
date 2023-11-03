import 'package:medify/src/utils/UI/widget/Select/models/select_item.dart';
import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  SelectItem? curretValue;
  List<SelectItem>? listValues;
  String? label;
  String? description;
  Function? onChangue;
  double? width;
  IconData? icon;
  // double? width = null;

  @required
  Select({
    Key? key,
    this.curretValue,
    this.listValues,
    this.label,
    this.description,
    this.onChangue,
    this.width,
    this.icon,
    // this.mini
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<Select> createState() => SelectState(
      curretValue: curretValue,
      description: description,
      label: label,
      listValues: listValues,
      onChangue: onChangue,
      width: width);
}

class SelectState extends State<Select> {
  SelectItem? curretValue;
  List<SelectItem>? listValues;
  String? label;
  String? description;
  Function? onChangue;
  double? width;

  SelectState(
      {Key? key,
      this.curretValue,
      this.listValues,
      this.label,
      this.description,
      this.onChangue,
      this.width})
      : super();

  bool search = false;

  Size? sizeScreen;

  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        _opcionPicker(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          // width: widget.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color.fromARGB(255, 58, 59, 60),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  //  blurRadius: 5,
                  //  spreadRadius: 1,
                  offset: Offset(0, 2),
                )
              ]),
          // color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 4),
            child: Column(
              children: [
                Container(
                  // color: ,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              widget.icon != null
                                  ? Icon(
                                      widget.icon,
                                      color: curretValue!.value != null
                                          ? Colors.white
                                          : Colors.black38,
                                    )
                                  : Container(),
                              // const Icon(Icons.domain_rounded),
                              widget.icon != null
                                  ? const SizedBox(width: 5)
                                  : Container(),
                              SizedBox(
                                // width: 5,
                                // color: Colors.black38,
                                child: Row(
                                  children: [
                                    Container(
                                        //  width: width!/2.8,
                                        // color: Colors.black,
                                        child: Text(
                                            label == '' ? '' : "$label: ",
                                            style: TextStyle(),
                                            textScaleFactor: 1,
                                            overflow: TextOverflow.ellipsis)),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: width! / 4,
                                          // width: ,
                                          // color: Colors.amber,
                                          child: curretValue!.value == null
                                              ? Text(
                                                  description ?? "Seleccione",
                                                  style: TextStyle()
                                                  // ,overflow: TextOverflow.ellipsis,
                                                  ,
                                                  maxLines: 1,
                                                  textScaleFactor: 1)
                                              : Text(curretValue!.key!,
                                                  style: TextStyle()
                                                  // ,overflow: TextOverflow.ellipsis,
                                                  ,
                                                  maxLines: 1,
                                                  textScaleFactor: 1),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down_sharp),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   width: width,
                //   height: 2,
                //   color:
                //
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _opcionPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return OptionsSelect(
            curretValue: curretValue!,
            description: description!,
            label: label!,
            listValues: listValues!,
            onChangue: onChangue!,
          );
        });
  }
}

class OptionsSelect extends StatefulWidget {
  SelectItem? curretValue;
  List<SelectItem>? listValues;
  String? label;
  String? description;
  Function? onChangue;

  OptionsSelect(
      {this.curretValue,
      this.listValues,
      this.label,
      this.description,
      this.onChangue});

  @override
  State<OptionsSelect> createState() => _OptionsSelectState(
      curretValue: curretValue,
      description: description,
      label: label,
      listValues: listValues,
      onChangue: onChangue);
}

class _OptionsSelectState extends State<OptionsSelect> {
  SelectItem? curretValue;
  List<SelectItem>? listValues;
  String? label;
  String? description;
  Function? onChangue;

  _OptionsSelectState(
      {this.curretValue,
      this.listValues,
      this.label,
      this.description,
      this.onChangue});

  Size? sizeScreen;
  // FocusNode focusSearch = FocusNode();

  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.of(context).size;
    return Container(
      height: sizeScreen!.height * 2,

      // color: Color.fromRGBO(255, 255, 255, .9),
      child: Container(
        child: _opcions(),
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      ),
    );
  }

  Widget _opcions() {
    bool black = false;
    List<Widget> listOptions = listValues!.map((item) {
      black = !black;
      return Container(
        color: curretValue!.key == item.key
            ? Colors.red
            : (black ? Colors.black12 : Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ListTile(
              onTap: () async {
                Navigator.pop(context);
                curretValue!.value = item.value;
                curretValue!.key = item.key;
                onChangue!();
              },
              title: Text(item.key!,
                  style: TextStyle(
                      color: curretValue!.key == item.key
                          ? Colors.white
                          : Colors.white)),
            )
          ]),
        ),
      );
    }).toList();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
            children: [
          Container(
            // height: ,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                // color: Colors.black12,
                child: Container(
                  // color: Colors.black12,
                  // height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // color: Colors.amber,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              label!,
                              style: TextStyle(),
                            ),
                            Text(description!, style: TextStyle()
                                // style: disableText,
                                )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]
              ..add(Container(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          onTap: () async {
                            Navigator.pop(context);
                            curretValue!.value = null;
                            curretValue!.key = null;
                            onChangue!();
                            // setState(() {});
                          },
                          title: Text("Ninguno", style: TextStyle()),
                        )
                      ]),
                ),
              ))
              ..addAll(listOptions)),
      ),
    );
  }
}
