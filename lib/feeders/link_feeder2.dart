import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wifi_scan/wifi_scan.dart';

import '../navigation/appBarCustomized.dart';

class linkFeeder2 extends StatefulWidget {
  const linkFeeder2({Key? key}) : super(key: key);

  @override
  State<linkFeeder2> createState() => _linkFeeder2State();
}

class _linkFeeder2State extends State<linkFeeder2> {
  final TextEditingController controllerPassword = TextEditingController();
  final FocusNode focusNodePassword = FocusNode();

  List<WiFiAccessPoint> accessPoints = <WiFiAccessPoint>[];

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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child: Container(
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "3",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ),
                Flexible(
                    child: Text(
                        "Active el WiFi del dispositivo y busque en la siguiente "
                        "lista la red que desea utilizar."))
              ],
            ),
            Expanded(
              flex: 40,
              child: FutureBuilder(
                future: getWifis(),
                builder: (context, snapshot) {
                  List<WiFiAccessPoint> myList = [];
                  if (snapshot.data != null) {
                    myList = snapshot.data! as List<WiFiAccessPoint>;
                  }
                  print("wifis length: ${myList.length}");
                  return CupertinoPicker.builder(
                    onSelectedItemChanged: (value) {},
                    itemExtent: 25,
                    diameterRatio: 1,
                    useMagnifier: true,
                    magnification: 1.2,
                    itemBuilder: (BuildContext context, int index) {
                      if (index > 0 && index < myList.length) {
                        WiFiAccessPoint wifi = myList[index];

                        return Text("${wifi.ssid}");
                      }
                    },
                  );
                },
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  ClipOval(
                    child: Container(
                      color: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "4",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text("Ingrese la contraseña de la red "
                        "WiFi seleccionada."),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 30,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
                controller: controllerPassword,
                focusNode: focusNodePassword,
                obscureText: true,
                // keyboardType: TextInputType.text,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: Text("Verificar"),
        onPressed: () {},
      ),
    );
  }

  Future<List> getWifis() async {
    var result = await WiFiScan.instance.getScannedResults();
    List<WiFiAccessPoint> wifis = result.value!;
    return wifis;
  }
}
