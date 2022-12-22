import 'package:flutter/cupertino.dart';

class UiData {

  static dynamic getScreenWidth(context){
    return MediaQuery.of(context).size.width;
  }
  static dynamic getScreenHeight(context){
    return MediaQuery.of(context).size.height;
  }
}
