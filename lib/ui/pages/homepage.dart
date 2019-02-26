import 'package:flutter/material.dart';
import 'additem.dart';
import 'itemdetails.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List items = [] ;
   addItem1(String title , String description, File image ){
    setState(() {
     items.add({
       "title":title,
       "description":description,
       "img":image,
     }); 
    });    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Item list"),
            ),
        backgroundColor:Colors.pinkAccent,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
        var item = items[index];
        return ListTile(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(
            builder: (_) => ItemDetails(item:item)
          )),
          isThreeLine: true,
           title: Text(item["title"]),
           leading: CircleAvatar(
             backgroundImage:FileImage(item["img"],),
             radius: 34,
               ),
             subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               Text(item["description"]),
               SizedBox(height: 40,),
            //  Text(item["picture"])
               ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(
          builder: (_) =>AddItem1(addItem1)
            )),
           tooltip: "Add Item",
        child: Icon(Icons.add),
      ),
    );
  }
}


// final List items = [
//     {
//       "title": "Book",
//       "description": "This is my Databsae book .",
//       "picture": "assets/img1.jpg",       
//     },
//       {
//       "title": "Pen",
//       "description": "This is my pen .",
//       "picture": "assets/img2.jpg",
//     },
//       {
//       "title": "Sim card",
//       "description": "This is my sim card .",
//       "picture": "assets/img3.jpg",   
//     },
//       {
//       "title": "mouse",
//       "description": "This is my mouse.",
//       "picture": "assets/img3.jpg",
//     },
//     {
//       "title": "Wifi Adapter",
//       "description": "This is my Wifi Dangol.",
//       "picture": "assets/img1.jpg",
//     },
//   ];