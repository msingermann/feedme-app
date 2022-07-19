import 'package:flutter/material.dart';
import 'package:smart_feeder/pets/petRow.dart';

class feederRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final card = new Container(
      // height: 124.0,
      width: MediaQuery.of(context).size.width,
      margin: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
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
          Row(children: [
            Container(
                margin: new EdgeInsets.symmetric(vertical: 16.0),
                alignment: FractionalOffset.centerLeft,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: Image(
                        image: new AssetImage("assets/images/food_feeder.png"),
                      ),
                      iconSize: 50,
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Image(
                        image:
                            new AssetImage("assets/images/water_dispenser.png"),
                      ),
                      iconSize: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.add, color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(50, 50),
                        shape: CircleBorder(),
                        primary: Colors.blue,
                      ),
                    ),
                  ],
                ))
          ]),
        ],
      ),
    );

    return card;
  }
}
