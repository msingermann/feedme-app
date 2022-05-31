import 'package:flutter/material.dart';
import 'package:smart_feeder/route_generator.dart';

void main() => runApp(SmartFeeder());

class SmartFeeder extends StatelessWidget {
  const SmartFeeder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Feeder',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isSplashVisible = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {return false;},
      child: Scaffold(
        body: muestraSplash(),
      ),
    );
  }

  @override
  void initState() {
    super.initState(); //when this route starts, it will execute this code
    Future.delayed(const Duration(seconds: 1), () { //asynchronous delay
      if (isSplashVisible) { //checks if widget is still active and not disposed
        loadLogin();
      }
    });
  }
  muestraSplash(){
      return Container(
      //color: Colors.deepOrangeAccent,
      color: Color.fromRGBO(252, 213, 167, 1),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Image.asset('assets/images/corgyHello.jpg')
                    ),
                    Text('Smart Feeder',  style: TextStyle(fontFamily: 'TitanOne', fontSize: 50))
                  ]
              )
            )
          ],
        )
      )
    );
  }

  loadLogin(){
    return Navigator.of(context).pushNamed('/login');
  }
}

