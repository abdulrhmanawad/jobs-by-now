import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CommonInputForm extends StatelessWidget {

  CommonInputForm({this.labelText,this.textEditingController,this.isNumber=false});

  final String labelText;
  final TextEditingController textEditingController;
  final bool isNumber;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: TextFormField(
        controller: textEditingController,
        validator: (val){
          if(val.isEmpty){
            return "the Field Can't be Empty";
          }else if(isNumber&&val.length<9){
            return "please Enter the valid mobile number";
          }else{
            return null;
          }


        },
        keyboardType: isNumber?TextInputType.number:TextInputType.text,
        decoration: InputDecoration(
          focusColor:  Color(0xff1FB9D1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0),),
          ),
          labelText: labelText,
          labelStyle: GoogleFonts.montserrat(fontSize: 15),

        ),
      ),
    );
  }
}