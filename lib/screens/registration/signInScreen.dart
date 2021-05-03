import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'file:///C:/Users/HP/Desktop/Flutter/jobsbynow/lib/screens/registration/signUpScreen.dart';
import 'package:jobsbynow/widgets/CommonInputFormPassword.dart';
import 'package:jobsbynow/widgets/commonInputForm.dart';
class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailTextEditingController;
  TextEditingController passwordTextEditingController;
  String email;
  String password;
  final _formKey=GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailTextEditingController=TextEditingController();
    passwordTextEditingController=TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,

        children: [
          Image.asset('assets/images/bottombackground.png', width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,color: Color.fromRGBO(255, 255, 255, 0.7),
              colorBlendMode: BlendMode.modulate),
          Container(
            height:MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
Center(child: SvgPicture.asset("assets/logo.svg",width:MediaQuery.of(context).size.width/2,height: MediaQuery.of(context).size.width/2,)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20.0),
                    child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sign In",style: GoogleFonts.montserrat(fontSize:Theme.of(context).textTheme.headline4.fontSize,),textAlign: TextAlign.justify,),
                        SizedBox(height: 20),
                        Text("Hi there! Nice to see you again.",style: GoogleFonts.montserrat(fontSize:Theme.of(context).textTheme.subtitle1.fontSize),),
                        SizedBox(height: 20),
                        CommonInputForm(labelText: "Email",textEditingController: emailTextEditingController,),
                        SizedBox(height: 15),
                        CommonInputFormPassword(labelText: "Password",textEditingController: passwordTextEditingController,),
                        SizedBox(height: 20),
                        Center(
                          child: MaterialButton(
                            onPressed: (){
                              if(_formKey.currentState.validate()){
                                setState(() {
                              email=emailTextEditingController.text;
                              password=passwordTextEditingController.text;
                            });
                            print("email:$email\n password:$password");}},
                            minWidth: MediaQuery.of(context).size.width,
                            height: 48.0,
                            color: Color(0xff1FB9D1),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.all(Radius.circular(8.0))
                           ),
                            child: Text(
                                "Sign In",
                                style:GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white))
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Center(child: Text("or use one of your social profiles",style: GoogleFonts.montserrat(fontSize:Theme.of(context).textTheme.subtitle2.fontSize,fontWeight: FontWeight.w300),)),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialButton(labelText: "Google",color: Colors.red,),
                            SizedBox(width: 10,),
                            SocialButton(labelText: "Facebook",color: Color(0xff395697),)
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text("Forgot Password ?",style: GoogleFonts.montserrat(fontSize:Theme.of(context).textTheme.subtitle2.fontSize,fontWeight: FontWeight.w300),),
                            SizedBox(width: 5,),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SignUpScreen()));
                              },
                                child: Text("Sign up",style: GoogleFonts.montserrat(fontSize:Theme.of(context).textTheme.subtitle2.fontSize,fontWeight: FontWeight.w400,color: Color(0xff1FB9D1)),)),

                          ],
                        ),
                      ],
                    ),
                  ),),
                  Center(child: Container(
                      width: MediaQuery.of(context).size.width-100,
                      child: Text("By continuing, you agree to accept our Privacy Policy & Terms of Service.",style: GoogleFonts.montserrat(fontSize:Theme.of(context).textTheme.overline.fontSize,fontWeight: FontWeight.w400,color: Colors.grey.shade400),textAlign: TextAlign.center,))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
final String labelText;
final Color color;
SocialButton({this.labelText,this.color});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: (){},
      minWidth: 111.0,
      height: 41.0,
      color:color,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))
      ),
      child: Text(
          labelText,
          style:GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white))
      ),
    );
  }
}
