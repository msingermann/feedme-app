import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:smart_feeder/navigation/appBarCustomized.dart';
import 'device.dart';
import 'link_feeder2.dart';

class linkFeeder extends StatefulWidget {
  const linkFeeder({Key? key}) : super(key: key);

  @override
  State<linkFeeder> createState() => _linkFeederState();
}

class _linkFeederState extends State<linkFeeder> {
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
            Text("Agregar alimentador", style: TextStyle(fontSize: 30)),
            Row(
              children: [
                ClipOval(
                  child: Container(
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "1",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ),
                Flexible(
                  child: Text("Conecte el alimentador a la red electrica."),
                ),
              ],
            ),
            Image(
              image: new AssetImage("assets/images/plug.gif"),
              height: 200,
            ),
            Row(
              children: [
                ClipOval(
                  child: Container(
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "2",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ),
                Flexible(
                  child: Text("Active el Bluetooth del dispositivo y busque "
                      "en la siguiente lista el codigo de vinculacion que se "
                      "encuentra en la etiqueta trasera."),
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder<List<ScanResult>>(
                stream: FlutterBlue.instance.scanResults,
                initialData: [],
                builder: (c, snapshot) => CupertinoPicker(
                  onSelectedItemChanged: (value) {},
                  itemExtent: 25,
                  diameterRatio: 1,
                  useMagnifier: true,
                  magnification: 1.2,
                  children: snapshot.data!
                      .map((result) => Text(result.device.name == ""
                          ? "No Name "
                          : result.device.name))
                      .toList(),
                ),
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
            MaterialPageRoute(builder: (context) => linkFeeder2()),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    FlutterBlue.instance.startScan(timeout: Duration(seconds: 4));
  }
}
