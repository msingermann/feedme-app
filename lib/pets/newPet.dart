import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_feeder/navigation/appBarCustomized.dart';
import 'package:smart_feeder/pets/planAlimentacion.dart';

import 'linkTag.dart';

class newPet extends StatelessWidget {
  List<DropdownMenuItem<String>> razas = [
    DropdownMenuItem(child: Text("1"), value: "1"),
    DropdownMenuItem(child: Text("2"), value: "2"),
    DropdownMenuItem(child: Text("3"), value: "3"),
    DropdownMenuItem(child: Text("4"), value: "4"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomized(
        appBar: AppBar(),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 58,
              backgroundImage: AssetImage("assets/images/profile.png"),
              child: Stack(children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white70,
                    child: Icon(Icons.add),
                  ),
                ),
              ]),
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                    ),
                  ),
                  DropdownButtonFormField(
                    items: razas,
                    onChanged: null,
                    decoration: InputDecoration(labelText: "Raza"),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Peso',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Positioned(right: 0, bottom: 0, child: Text('kg.')),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: Text("Siguiente"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => linkTag()),
          );
        },
      ),
    );
  }
}
