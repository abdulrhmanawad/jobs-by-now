import 'package:flutter/material.dart';
class StateScreen extends ChangeNotifier{
  bool isChecked=false;
  bool get status=>isChecked;
  set statusValue(bool value){
    isChecked=value;
    notifyListeners();
  }

}