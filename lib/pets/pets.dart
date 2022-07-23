import 'package:flutter/material.dart';
import 'package:smart_feeder/navigation/appBarCustomized.dart';
import 'package:smart_feeder/pets/newPet.dart';
import 'package:smart_feeder/pets/petRow.dart';
import 'package:flutter/foundation.dart';

class Pets extends StatelessWidget {
  const Pets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomized(
        appBar: AppBar(),
      ),
      body: Center(
          child: Column(children: [
        Text('Mascotas', style: TextStyle(fontSize: 40)),
        petRow(),
        petRow(),
      ])),
      floatingActionButton: kIsWeb
          ? null
          : FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => newPet()),
                );
              },
              child: Icon(Icons.add)),
    );
  }
}
