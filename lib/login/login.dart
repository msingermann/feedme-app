import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            body: Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
          //LOGO
          Container(
            /*height: 150,
                      width: 280,*/
            child: Column(children: [
              Image.asset('assets/images/corgyHello_small_trans.png'),
              Text('Feed.me!',
                  style: new TextStyle(fontFamily: 'TitanOne', fontSize: 40)),
            ]),
          ),

          // RESTO
          Container(
              width: 450,
              padding: EdgeInsets.only(top: 40),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Ingrese su email (abc@abc.com)'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Contraseña',
                        hintText: 'Ingrese su contraseña'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => passwordRecovery(context),
                      child: Text(
                        '¿Olvidó su contraseña?',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                    TextButton(
                      onPressed: () => register(context),
                      child: Text(
                        'Registrarse!',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/mainPage');
                    },
                    child: Text('Ingresar',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ]))
        ]))));
  }

  passwordRecovery(BuildContext context) {
    Navigator.of(context).pushNamed('/password_recovery');
  }

  register(BuildContext context) {
    Navigator.of(context).pushNamed('/register');
  }
}
