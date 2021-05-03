import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jobsbynow/provider.dart';
import 'package:jobsbynow/screens/registration/signInScreen.dart';
import 'package:jobsbynow/utils/constant.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StateScreen>(
      create: (_)=>StateScreen(),
      child: MaterialApp(
        supportedLocales: locales,
        localizationsDelegates: [
          CountryLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:SignInScreen(),
      ),
    );
  }
}


