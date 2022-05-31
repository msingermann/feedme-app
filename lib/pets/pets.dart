import 'package:flutter/material.dart';
import 'package:smart_feeder/navigation/appBarCustomized.dart';

class Pets extends StatelessWidget {
  const Pets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomized(appBar: AppBar(),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Mascotas', style: TextStyle(fontSize: 40)),
          ]
        )
      )
    );
  }
}
