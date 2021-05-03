import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CommonInputFormPassword extends StatelessWidget {

  CommonInputFormPassword({this.labelText,this.textEditingController,this.isShow=false});

  final String labelText;
  final TextEditingController textEditingController;
  final bool isShow;


  void checkState(bool state){
    state=!state;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: TextFormField(
        controller: textEditingController,
        validator:(val){
          if(val.isEmpty||val.length<6){
            return "please Enter your password";
          }
          else{
            return null;
          }
        } ,
        obscureText: true,
        decoration: InputDecoration(
          suffixIcon: IconButton(icon:Icon(isShow?Icons.visibility:Icons.visibility_off) ,onPressed:(){
            checkState(isShow);
          },),
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(10.0)),
          ),
          labelText: labelText,
          labelStyle:GoogleFonts.montserrat(fontSize: 15),
        ),
      ),
    );
  }}