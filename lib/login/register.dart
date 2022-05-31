import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_feeder/navigation/appBarCustomized.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Text("Registro", style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                      ]
                    ),
                    Padding(padding: EdgeInsets.only(top:50)),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Apellido',
                        hintText: 'Apellido'
                      )
                    ),
                    Padding(padding: EdgeInsets.only(top:20)),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nombre',
                        hintText: 'Nombre',
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top:20)),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Email (Ej. aaa@bbb.com)',
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top:20)),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Teléfono',
                        hintText: 'Teléfono (Ej. 1122223333)',
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top:20)),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Contraseña',
                          hintText: 'Ingrese su contraseña'
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top:20)),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Reingrese la contraseña',
                          hintText: 'Reingrese la contraseña'
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top:20)),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () => register(),
                            child: Text('Registrarme!', style: TextStyle(fontSize: 17),)
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }

  register(){

  }
}
