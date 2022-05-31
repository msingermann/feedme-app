import 'package:flutter/material.dart';
import 'package:smart_feeder/main.dart';
import 'package:smart_feeder/login/login.dart';
import 'package:smart_feeder/login/password_recovery.dart';
import 'package:smart_feeder/login/register.dart';
import 'package:smart_feeder/mainPage/mainPage.dart';
import 'package:smart_feeder/feeders/feeders.dart';
import 'package:smart_feeder/pets/pets.dart';
import 'package:smart_feeder/profile/profile.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    //Gets arguments passed in with Navigator.pushNamed
    final args = settings.arguments;

    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FirstPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/password_recovery':
        return MaterialPageRoute(builder: (_) => PasswordRecovery());
      case '/register':
        return MaterialPageRoute(builder: (_) => Register());
      case '/mainPage':
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/feeders':
        return MaterialPageRoute(builder: (_) => Feeder());
      case '/pets':
        return MaterialPageRoute(builder: (_) => Pets());
      case '/profile':
        return MaterialPageRoute(builder: (_) => Profile());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return const Scaffold(
          body: Center(
              child: Text('ERROR EN RUTA')
          )
      );
    });
  }
}

