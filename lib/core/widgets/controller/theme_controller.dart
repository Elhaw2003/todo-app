import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/main.dart';

class ThemeProvider extends ChangeNotifier {

  setSwitchValueHive (){
    switchValue = Hive.box(settingsBox).get("switchValue") ?? false;
    notifyListeners();
  }

  bool switchValue = false;


  changeSwitchValue(bool t)async{

    switchValue = t;
    await Hive.box(settingsBox).put("switchValue", t);
    switchValue = Hive.box(settingsBox).get("switchValue");
    //setstate(){};
    notifyListeners();
  }


}