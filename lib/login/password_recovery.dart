import 'package:flutter/material.dart';
import 'package:smart_feeder/navigation/appBarCustomized.dart';

class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomized(appBar: AppBar(),),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 450,
              padding: EdgeInsets.only(top: 40),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children:[
                    Text('Recuperar contraseña', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                    Padding(padding: EdgeInsets.only(top: 50)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Ingrese su email:', style: TextStyle(fontSize: 20)),
                      ]
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Ingrese su email (abc@abc.com)'
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () => passwordRecovery(),
                          child: Text('Recuperar contraseña', style: TextStyle(fontSize: 17))
                        ),
                      ],
                    ),
                  ]
                )
              )
            )
          ]
        )
      ),
    );
  }

  passwordRecovery(){

  }
}
