import 'package:flutter/material.dart';
import 'package:smart_feeder/navigation/appBarCustomized.dart';
import 'package:flutter/cupertino.dart';

class horarioCantidadPlanAlimentacion extends StatelessWidget {
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
          children: [
            Text('Horario', style: TextStyle(fontSize: 30)),
            Expanded(
              child: CupertinoTimerPicker(
                mode: CupertinoTimerPickerMode.hm,
                minuteInterval: 1,
                secondInterval: 1,
                initialTimerDuration: new Duration(),
                onTimerDurationChanged: (Duration changedtimer) {},
              ),
            ),
            Text('Cantidad en el plato', style: TextStyle(fontSize: 30)),
            Expanded(
              child: CupertinoPicker(
                onSelectedItemChanged: (value) {},
                itemExtent: 25,
                diameterRatio: 1,
                useMagnifier: true,
                magnification: 1.2,
                children: getCantidades()
                    .map((result) => Text(result.toString()))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: Text("Agregar"),
        onPressed: () {},
      ),
    );
  }

  List<int> getCantidades() {
    List<int> cantidades = <int>[];
    for (int i = 0; i < 10; i++) {
      cantidades.add(10 + (10 * i));
    }
    return cantidades;
  }
}
