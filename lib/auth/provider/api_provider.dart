import 'dart:io';

import 'package:flutter/material.dart';

   Future<ThemeData> getThemeFromApi(){
     ThemeData themeData=ThemeData(
       primaryColor: Colors.black
     );
     return Future.value(themeData);
   }

Future<ThemeData> getThemeFromApia(){
  ThemeData themeData=ThemeData(
      primaryColor: Colors.black
  );
  return Future.value(themeData);
}
