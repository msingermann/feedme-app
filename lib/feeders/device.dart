import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wifi_iot/wifi_iot.dart';

import 'SelectListItemFuture.dart';
import 'package:smart_feeder/navigation/appBarCustomized.dart';

class DeviceScreen extends StatelessWidget {
  DeviceScreen({Key? key, required this.device}) : super(key: key);

  final BluetoothDevice device;

  WifiNetwork? wifiSelected;
  final TextEditingController controllerWifi = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final FocusNode focusNodePassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomized(
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamBuilder<BluetoothDeviceState>(
              stream: device.state,
              initialData: BluetoothDeviceState.connecting,
              builder: (c, snapshot) => ListTile(
                leading: (snapshot.data == BluetoothDeviceState.connected)
                    ? const Icon(Icons.bluetooth_connected)
                    : const Icon(Icons.bluetooth_disabled),
                title: Text(
                    '${device.name} is ${snapshot.data.toString().split('.')[1]}.'),
                subtitle: Text('${device.id}'),
                // trailing: StreamBuilder<bool>(
                //   stream: device.isDiscoveringServices,
                //   initialData: false,
                //   builder: (c, snapshot) => IndexedStack(
                //     index: snapshot.data! ? 1 : 0,
                //     children: <Widget>[
                //       TextButton(
                //         child: const Text("Show Services"),
                //         onPressed: () => device.discoverServices(),
                //       ),
                //       const IconButton(
                //         icon: SizedBox(
                //           child: CircularProgressIndicator(
                //             valueColor: AlwaysStoppedAnimation(Colors.grey),
                //           ),
                //           width: 18.0,
                //           height: 18.0,
                //         ),
                //         onPressed: null,
                //       )
                //     ],
                //   ),
                // ),
                trailing: StreamBuilder<BluetoothDeviceState>(
                  stream: device.state,
                  initialData: BluetoothDeviceState.connecting,
                  builder: (c, snapshot) {
                    VoidCallback? onPressed;
                    String text;
                    switch (snapshot.data) {
                      case BluetoothDeviceState.connected:
                        device.discoverServices();
                        onPressed = () => device.disconnect();
                        text = 'DISCONNECT';
                        break;
                      case BluetoothDeviceState.disconnected:
                        onPressed = () => device.connect();
                        text = 'CONNECT';
                        break;
                      default:
                        onPressed = null;
                        text = snapshot.data
                            .toString()
                            .substring(21)
                            .toUpperCase();
                        break;
                    }
                    return TextButton(
                        onPressed: onPressed,
                        child: Text(
                          text,
                          // style: Theme.of(context)
                          //     .primaryTextTheme
                          //     .button
                          //     ?.copyWith(color: Colors.white),
                        ));
                  },
                ),
              ),
            ),
            StreamBuilder<List<BluetoothService>>(
              stream: device.services,
              initialData: [],
              builder: (c, snapshot) {
                return Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Column(
                    // children: _buildServiceTiles(snapshot.data!, context),
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Wifi network",
                        ),
                        controller: controllerWifi,
                        readOnly: true,
                        onTap: () async {
                          wifiSelected = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectListItemFuture()),
                          );
                          controllerWifi.value = controllerWifi.value.copyWith(
                            text: wifiSelected?.ssid,
                          );
                        },
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Password",
                        ),
                        controller: controllerPassword,
                        focusNode: focusNodePassword,
                        obscureText: true,
                        // keyboardType: TextInputType.text,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (datosCompletos()) {
                              print(controllerPassword.value.text);
                              print(wifiSelected?.toJson());
                              wifiSelected?.password =
                                  controllerPassword.value.text;

                              Map<String, dynamic> wifi = {
                                'ssid': wifiSelected?.ssid,
                                'password': controllerPassword.value.text
                              };
                              String rawJson = jsonEncode(wifi);

                              // e.characteristics[0].write(utf8.encode(rawJson));
                              // List<BluetoothService> services = snapshot.data!;
                              var services = await device.discoverServices();
                              var last = services.length;
                              services[last - 1]
                                  .characteristics[0]
                                  .write(utf8.encode(rawJson));
                            }
                          },
                          child: Text("Send")),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  bool datosCompletos() {
    if (controllerWifi.value.text == "") {
      showToast("Falta seleccionar la red Wifi");
      return false;
    }
    if (controllerPassword.value.text == "") {
      showToast("Falta completar la contraseña");
      focusNodePassword.requestFocus();
      return false;
    }

    return true;
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
