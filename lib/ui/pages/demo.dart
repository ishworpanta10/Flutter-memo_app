import 'package:flutter/material.dart';
import 'homepage.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (_)=>HomePage()
            ));
          },
        ),
        title: Text(
          "Demo Page",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.grey.shade200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Hello"),
            SizedBox(height: 20),
            InkWell(
              child: Text("Hello InkWell"),
              onTap: () => print("Tab called"),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.yellow,
        
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text("Following"),),
          BottomNavigationBarItem(
              icon: Icon(Icons.games), title: Text("Games")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("setting")),
        ],
        onTap: (int i) => print("hey $i"),
      ),
    );
  }
}
