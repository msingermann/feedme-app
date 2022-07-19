import 'package:flutter/material.dart';

import '../pets/petRow.dart';

class infoFeeder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final card = new Container(
      // height: 124.0,
      width: MediaQuery.of(context).size.width,
      margin: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      // constraints: new BoxConstraints.expand(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFEEEEEE),
      ),
      child: new Column(
        children: [
          Row(
            children: [
              Container(
                margin: new EdgeInsets.fromLTRB(25.0, 50.0, 0, 0),
              ),
              Expanded(
                flex: 80,
                child: new Text("nombre feeder"),
              ),
              Expanded(
                flex: 20,
                child: new Icon(Icons.circle, color: Colors.green),
              )
            ],
          ),
          new petRow(),
          new petRow(),
        ],
      ),
    );

    return new Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            card,
          ],
        ));
  }
}
