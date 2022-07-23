import 'package:flutter/material.dart';
import 'package:smart_feeder/feeders/link_feeder.dart';
import 'package:smart_feeder/navigation/appBarCustomized.dart';
import 'package:flutter/foundation.dart';

import 'feederRow.dart';

class Feeder extends StatefulWidget {
  const Feeder({Key? key}) : super(key: key);

  @override
  State<Feeder> createState() => _FeederState();
}

class _FeederState extends State<Feeder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomized(
        appBar: AppBar(),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 50, 60, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Alimentadores',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  feederRow(),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: kIsWeb
          ? null
          : FloatingActionButton(
              onPressed: () => link(context), child: Icon(Icons.add)),
    );
  }

  link(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => linkFeeder()),
    );
  }
}
