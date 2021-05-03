import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobsbynow/screens/homeScreen.dart';
import 'file:///C:/Users/HP/Desktop/Flutter/jobsbynow/lib/screens/registration/signInScreen.dart';
import 'package:jobsbynow/widgets/CommonInputFormPassword.dart';
import 'package:jobsbynow/widgets/commonInputForm.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameTxtEditingController;
  TextEditingController lastNameTxtEditingController;
  TextEditingController codeNameTxtEditingController;
  TextEditingController mobileTxtEditingController;
  TextEditingController emailTxtEditingController;
  TextEditingController passwordTxtEditingController;
  TextEditingController confirmPasswordTxtEditingController;
  String first, last, code, mobile, email, password, confirmPassword;
  final _formKey=GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameTxtEditingController = TextEditingController();
    lastNameTxtEditingController = TextEditingController();
    codeNameTxtEditingController = TextEditingController();
    mobileTxtEditingController = TextEditingController();
    emailTxtEditingController = TextEditingController();
    passwordTxtEditingController = TextEditingController();
    confirmPasswordTxtEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color(0xff1FB9D1),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()),
                          (route) => false);
                    },
                    child: Text(
                      "Log in",
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ))),
          )
        ],
        title: Text(
          "Sign up ",
          style: GoogleFonts.montserrat(
            fontSize: 24.0,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/bottombackground.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
              color: Color.fromRGBO(255, 255, 255, 0.7),
              colorBlendMode: BlendMode.modulate),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Form(
              key: _formKey,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CommonInputForm(
                        labelText: "FirstName",
                        textEditingController: firstNameTxtEditingController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CommonInputForm(
                        labelText: "Last Name",
                        textEditingController: lastNameTxtEditingController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CountryCodePicker(
                              onChanged: (val) {
                                code = val.dialCode;
                                print(code);
                              },
                              initialSelection: 'IT',
                              favorite: ['+39', 'FR'],
                              showFlagDialog: true,
                              showDropDownButton: true,
                              showOnlyCountryWhenClosed: false,
                              showFlag: false,
                              boxDecoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              comparator: (a, b) => b.name.compareTo(a.name),
                              //Get the country information relevant to the initial selection
                              onInit: (code) => print(
                                  "on init ${code.name} ${code.dialCode} ${code.name}"),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                              flex: 2,
                              child: CommonInputForm(
                                labelText: "Mobile phone",
                                textEditingController: mobileTxtEditingController,
                                isNumber: true,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CommonInputForm(
                        labelText: "Email",
                        textEditingController: emailTxtEditingController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CommonInputFormPassword(
                        labelText: "password",
                        textEditingController: passwordTxtEditingController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CommonInputFormPassword(
                        labelText: "Confirm Password",
                        textEditingController: confirmPasswordTxtEditingController,
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: MaterialButton(
                          onPressed: () {
                            if(_formKey.currentState.validate()){
                              final snackBar = SnackBar(content: Text('Yay! wait for a while dude 😊 !'));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            setState(() {
                              first = firstNameTxtEditingController.text;
                              last = lastNameTxtEditingController.text;
                              mobile = mobileTxtEditingController.text;
                              email = emailTxtEditingController.text;
                              password = passwordTxtEditingController.text;
                              confirmPassword = confirmPasswordTxtEditingController.text;
                            });
                            print("firstName:$first\nlastName:$last\nmobile:$mobile\nemail:$email");
                            Future.delayed(
                              Duration(seconds: 10),
                            ).whenComplete(() => {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()),
                                      (route) => false)
                                });
                            }
                            else{
                              return;
                            }
                          },
                          minWidth: MediaQuery.of(context).size.width,
                          height: 48.0,
                          color: Color(0xff1FB9D1),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: Text("Sign Up",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Text(
                                "By continuing, you agree to accept our Privacy Policy & Terms of Service.",
                                style: GoogleFonts.montserrat(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .overline
                                        .fontSize,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade400),
                                textAlign: TextAlign.center,
                              ))),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
