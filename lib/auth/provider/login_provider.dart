import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier
{
  ThemeData _currentTheme;

  LoginProvider (this._currentTheme);

  SetTheme(ThemeData data)
  {
    _currentTheme=data;
    notifyListeners();

  }

  ThemeData getThemeDate(){
    return _currentTheme;
  }


}