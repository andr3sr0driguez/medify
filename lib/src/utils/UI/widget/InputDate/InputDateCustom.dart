import "package:flutter/material.dart";

class InputDateCustom extends StatefulWidget {
  //  InputDateCustom({super.key});
 DateTime selectedDate;
 String? Function(String?)? validator;
 Function(DateTime? time) onChangue;
 FocusNode? focus;
 Function(String? v)? onFieldSubmitted;

 InputDateCustom({required this.selectedDate, this.validator, required this.onChangue,  this.focus,this.onFieldSubmitted});
  @override
  State<InputDateCustom> createState() => _InputDateCustomState();
}

class _InputDateCustomState extends State<InputDateCustom> {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      child: Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
      boxShadow: [
        
        BoxShadow(
          color: Colors.black12,
          offset:  Offset(0,2)
        )

      ]
                       
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 15, vertical: 3),
      child: Focus(
        focusNode: widget.focus,
        onFocusChange: (bool foco) async {
            if(foco){

              FocusScope.of(context).requestFocus(FocusNode());
      
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: widget.selectedDate,
                firstDate: DateTime(1920, 8),
                lastDate: DateTime(2101),
              );
              
              widget.onChangue(picked);
              if(mounted){
                setState(() {
                
              });
            }
            }
        },
        child: TextFormField(
          // onFieldSubmitted: widget.onFieldSubmitted,
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: widget.validator,
          decoration: InputDecoration(
            
            labelText: "Fecha de nacimiento: " +
                widget.selectedDate.day.toString() +
                "/" +
                widget.selectedDate.month.toString() +
                "/" +
                widget.selectedDate.year.toString(),
      
            border: InputBorder.none,
      
            // filled: true,
          ),
          controller: TextEditingController(),
          keyboardType: TextInputType.datetime,
        
          
          
          onTap: () async {
      
        
      
          },
        ),
      ),
    ),
  ),
);
  }
}