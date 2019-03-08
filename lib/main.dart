import 'package:flutter/material.dart';
import 'ui/pages/homepage.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Complete Appplication",
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),

      //home: HomePage(),
      routes: {
        "builder": (_) => HomePage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => HomePage()));
  }

  final String back = "assets/brain.png";
  @override
  void initState() {
    super.initState();
    startTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Container(
          height: double.infinity,

          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Image.asset(back),
                SizedBox(
                  height: 30,
                ),
                SpinKitHourGlass(
                  color: Colors.white,
                  size: 100.0,
                ),
              ],
            ),
          ),
          // decoration: BoxDecoration(

          //     image: DecorationImage(

          //         image: AssetImage(
          //           back,
          //         ),

          //         fit: BoxFit.cover)),
        ));
  }
}
