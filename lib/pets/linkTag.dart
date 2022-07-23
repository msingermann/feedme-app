import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:smart_feeder/navigation/appBarCustomized.dart';
import 'package:smart_feeder/pets/planAlimentacion.dart';

class linkTag extends StatefulWidget {
  const linkTag({Key? key}) : super(key: key);

  @override
  State<linkTag> createState() => _linkTag();
}

class _linkTag extends State<linkTag> {
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
            Text("Vinculacion de identificador",
                style: TextStyle(fontSize: 30)),
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
                  child: Text("Mantenga presionado el boton central del "
                      "identificador hasta oir los dos pitidos."),
                ),
              ],
            ),
            Image(
              image: new AssetImage("assets/images/link_tag.jpg"),
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
                  child: Text("Seleccione el identificador de la siguiente "
                      "lista de dispositivos cercanos."),
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
            MaterialPageRoute(builder: (context) => planAlimentacion()),
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
