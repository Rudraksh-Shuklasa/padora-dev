
import 'package:flutter/material.dart';
import 'package:padora/auth/login/login_screen.dart';
import 'package:padora/auth/signup/signup_screen.dart';


import 'constants/route_constansts.dart';

class NavigationUtils {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case ROUTE_LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
        case ROUTE_REGISTER:
        return MaterialPageRoute(builder: (_) => SignUpScreen());


      default:
        return _errorRoute(" Comming soon...");
    }
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(title: Text('Error')),
          body: Center(child: Text(message)));
    });
  }

  static void pushReplacement(BuildContext context, String routeName,
      {Object arguments}) {
    Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> push(BuildContext context, String routeName,
      {Object arguments}) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static void pop(BuildContext context, {dynamic args}) {
    Navigator.of(context).pop(args);
  }

  static Future<dynamic> pushAndRemoveUntil(
      BuildContext context, String routeName,
      {Object arguments}) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }
}
