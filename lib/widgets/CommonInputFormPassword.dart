import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobsbynow/provider.dart';
import 'package:provider/provider.dart';
class CommonInputFormPassword extends StatelessWidget {
  final String labelText;
  final TextEditingController textEditingController;
  CommonInputFormPassword({this.labelText,this.textEditingController});
  @override
  Widget build(BuildContext context) {
var provider=Provider.of<StateScreen>(context);
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
        obscureText: provider.status,
        decoration: InputDecoration(
          suffixIcon: IconButton(icon:Icon(provider.status?Icons.visibility:Icons.visibility_off) ,onPressed:(){
            provider.statusValue=!provider.status;
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
