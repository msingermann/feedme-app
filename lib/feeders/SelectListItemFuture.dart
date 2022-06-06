import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:smart_feeder/navigation/appBarCustomized.dart';

class SelectListItemFuture extends StatefulWidget {
  @override
  _SelectListItemStateFuture createState() => _SelectListItemStateFuture();
}

class _SelectListItemStateFuture extends State<SelectListItemFuture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomized(
        appBar: AppBar(),
      ),
      body: projectWidget(),
    );
  }

  Widget projectWidget() {
    return FutureBuilder(
      future: getWifis(),
      builder: (context, AsyncSnapshot<List> projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          return Container();
        }
        List<WifiNetwork> myList = [];
        if (projectSnap.data != null)
          myList = projectSnap.data! as List<WifiNetwork>;
        return ListView.builder(
          itemCount: myList.length,
          itemBuilder: (context, index) {
            WifiNetwork wifi = myList[index];
            return Container(
              child: ListTile(
                title: Text("${wifi.ssid} ${wifi.level}"),
                onTap: () {
                  selectWifi(wifi);
                },
              ),
            );
          },
        );
      },
    );
  }

  Future<List> getWifis() async {
    List<WifiNetwork> wifis = await WiFiForIoTPlugin.loadWifiList();
    wifis.sort((w1, w2) => w2.level!.compareTo(w1.level!));
    return wifis;
  }

  void selectWifi(WifiNetwork wifi) {
    Navigator.pop(context, wifi);
  }
}
