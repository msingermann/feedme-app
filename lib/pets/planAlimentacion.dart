import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_feeder/navigation/appBarCustomized.dart';
import 'package:day_picker/day_picker.dart';

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
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: Text("Siguiente"),
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => linkFeeder2()),
          // );
          showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) {
                return _buildBottomPicker(timePicker());
              });
        },
      ),
    );
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }

  Widget timePicker() {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hms,
      minuteInterval: 1,
      secondInterval: 1,
      initialTimerDuration: initialtimer,
      onTimerDurationChanged: (Duration changedtimer) {},
    );
  }
}
