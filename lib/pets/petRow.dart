import 'package:flutter/material.dart';

class petRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final planetCard = Container(
      height: 124.0,
      width: MediaQuery.of(context).size.width,
      margin: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFBDBDBD),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 40,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("nombre mascota"),
                  ])),
          Expanded(
            flex: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: new AssetImage("assets/images/food_feeder.png"),
                      height: 50,
                    ),
                    Text("%"),
                  ],
                ),
                Text("peso: gr"),
                Text("promedio diario: gr"),
              ],
            ),
          )
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
            planetCard,
          ],
        ));
  }
}
