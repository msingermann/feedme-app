import 'package:flutter/material.dart';
import 'package:smart_feeder/feeders/link_feeder.dart';
import 'package:smart_feeder/navigation/appBarCustomized.dart';

class Feeder extends StatefulWidget {
  const Feeder({Key? key}) : super(key: key);

  @override
  State<Feeder> createState() => _FeederState();
}

class _FeederState extends State<Feeder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomized(appBar: AppBar(),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 50, 60, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Alimentadores',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                      onPressed: () => link(context),
                      child: Row(
                        children: [
                          Icon(Icons.add_link, size: 25, color: Colors.white),
                          // Padding(padding: EdgeInsets.only(left: 10)),
                          Text('Vincular Alimentador'),
                        ],
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  link(BuildContext context){
    Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => linkFeeder()),
        );
  }
}
