import 'package:flutter/material.dart';
import 'ui/pages/homepage.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Complete Appplication",
      
     theme: ThemeData(
      buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))       ),
      primarySwatch: Colors.blue,
      
     ), 
     
     home: HomePage(),
    );
  }
}

