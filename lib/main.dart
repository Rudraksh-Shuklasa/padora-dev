import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:padora/utils/constants/app_constansts.dart';
import 'package:padora/utils/constants/route_constansts.dart';
import 'package:padora/utils/localization/localization.dart';
import 'package:padora/utils/navigation.dart';
import 'package:provider/provider.dart';

import 'auth/provider/api_provider.dart';
import 'auth/provider/login_provider.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData themeData;
@override
  void initState() {
  getThemeFromApi().then((tata){
    setState(() {
    LoginProvider(themeData).SetTheme(themeData);
      themeData=tata;
    });
  });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (_)=>LoginProvider(themeData),
      child: AppStart()
    );

  }
}


class AppStart extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final ThemeDesign = Provider.of<LoginProvider>(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
        title: APP_NAME,
        theme: ThemeDesign.getThemeDate(),
        initialRoute: ROUTE_LOGIN,
        onGenerateRoute: NavigationUtils.generateRoute,
        localizationsDelegates: [
          const MyLocalizationsDelegate(),
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
          // const Locale('es', ''),
        ],
    );


  }
}
