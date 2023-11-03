import 'package:flutter/material.dart';

class BotomSendWidget extends StatefulWidget {

  Function onTap;
  String textButtom;
  Color colorButtom;
  Color colorShadow;
  BotomSendWidget({Key? key, required this.onTap,required this.textButtom, required this.colorButtom,required this.colorShadow}) : super(key: key);

  @override
  State<BotomSendWidget> createState() => _BotomSendWidgetState(onTap: onTap, textButtom: textButtom,colorButtom: colorButtom,colorShadow: colorShadow );
  
}

class _BotomSendWidgetState extends State<BotomSendWidget> {

  Function onTap;
  String textButtom;
  Color colorButtom;
  Color colorShadow;

  _BotomSendWidgetState({required this.onTap,required this.textButtom, required this.colorButtom, required this.colorShadow});

  Size? size;
  // Color color = const Color.fromRGBO(31, 199, 212,1);
  Offset offset = const Offset(0, 2);
  double espacio = 0;
  double alfa = 0.0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Container(
        // duration: const Duration(milliseconds: 500),
    height: 75,
    // width: size!.width * 0.9,
    padding: const EdgeInsets.only(
      top: 5,
      left: 5,
      bottom: 5,
    ),
    
    margin: const EdgeInsets.only(bottom: 0),
    child: MouseRegion(

      onHover: (v){
      alfa = .2;
        if (this.mounted) setState(() {});
      },

      onExit: (v){
        alfa = 0;
         if (this.mounted) setState(() {});
      },
       cursor: SystemMouseCursors.click,
       
      child: GestureDetector(
        onTap: (){
          if(onTap != null){
            onTap();

             if (this.mounted){ 
              setState(() {

               alfa = 0;  
              });

             }
          }
        },

        onTapDown: (v){
          offset =  const Offset(0, 0);
          espacio = 3;
          alfa = .3;
           if (this.mounted) setState(() {});

        },

        onTapCancel: (){
          alfa = 0;
          // print("cansel");
          espacio = 0;
          offset =  const Offset(0, 2);
           if (this.mounted) setState(() {});
        },

        onTapUp:(v){
          alfa = 0;
          espacio = 0;
          offset =  const Offset(0, 2);
           if (this.mounted) setState(() {});
        },
        child: Column(
          children: [
            // SizedBox(height: espacio),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: colorButtom?? const Color.fromRGBO(31, 199, 212,1),
                borderRadius: BorderRadius.circular(16),
                 boxShadow: [
                        BoxShadow(
                          color:  onTap != null ? colorShadow?? const Color.fromRGBO(25, 125, 145, 1) : colorShadow,
                          blurRadius: 0,
                          spreadRadius: 0,
                          // offset: offset,
                        )
                      ]
              ),


              child: Container(
                decoration: BoxDecoration(
                  color: onTap != null ? Color.fromRGBO(255, 255, 255,alfa):Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                  
                ),
                child: Center(child: Text(textButtom??"",style:const  TextStyle(color: Colors.white,)),))
            ),
          ],
        ),
      ),
    )

  );
  }


}