import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_feeder/navigation/appBarCustomized.dart';
import 'package:day_picker/day_picker.dart';
import 'package:smart_feeder/pets/horarioCantidadPlanAlimentacion.dart';

class planAlimentacion extends StatelessWidget {
  double _kPickerSheetHeight = 216.0;

  Duration initialtimer = new Duration();

  List<DayInWeek> _days = [
    DayInWeek(
      "Lu ",
    ),
    DayInWeek(
      "Ma ",
    ),
    DayInWeek(
      "Mi ",
    ),
    DayInWeek(
      "Ju ",
    ),
    DayInWeek(
      "Vi ",
    ),
    DayInWeek(
      "Sa ",
    ),
    DayInWeek(
      "Do ",
    ),
  ];

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
            SelectWeekDays(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              days: _days,
              border: false,
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.orange,
              ),
              onSelect: (values) {
                // <== Callback to handle the selected days
                print(values);
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => horarioCantidadPlanAlimentacion()),
                );
              },
              child: Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                // fixedSize: const Size(50, 50),
                shape: CircleBorder(),
                // primary: Colors.blue,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: Text("Siguiente"),
        onPressed: () {},
      ),
    );
  }
}
