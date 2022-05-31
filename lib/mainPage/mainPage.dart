import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_feeder/navigation/appBarCustomized.dart';
import 'package:smart_feeder/navigation/navigation.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  Future<bool?> askExit(BuildContext context) async => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('¿Esta seguro que desea salir?'),
        actions: [
          ElevatedButton(onPressed: () => Navigator.pop(context, false), child: Text('No')),
          ElevatedButton(onPressed: () => Navigator.pop(context, true), child: Text('Si')),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final result = await askExit(context);

        if (result == true) {
          if (Platform.isAndroid){
            SystemNavigator.pop();
          }else if(Platform.isIOS) {
            exit(0);
          }
          return true;
        }
        else
          return false;
      },
      child: Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBarCustomized(appBar: AppBar()),
        body:
          Center(
          child: Container(
              child:  Text('MainPage', style: TextStyle(fontSize: 40)),
            )
          )
      ),
    );
  }


}
