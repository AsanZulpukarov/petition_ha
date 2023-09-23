import 'package:flutter/cupertino.dart';

import '../view/profile/screen/profile_screen.dart';

class SelectTabProvider extends ChangeNotifier{
  List<Widget> backList=[
  ];
  List<int> tabList=[
  ];
  int currentTab=0;
  Widget currentScreen = ProfileScreen();
  void toggleSelect(Widget newWidget,int tab){
    if(tab==4){
      backList.add(currentScreen);
      tabList.add(currentTab);
    }
    currentScreen=newWidget;
    currentTab=tab;
    notifyListeners();
  }
  void backFun(){
    currentScreen=backList.last;
    backList.removeLast();
    currentTab=tabList.last;
    tabList.removeLast();
    notifyListeners();
  }
}