import 'dart:io';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final Map item;

  const ItemDetails({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item["title"]),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DecoratedBox(
              child: Container(height: 400,width:400,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(item["img"],),
                )
              ),
            ),
            Text(item["title"], style: Theme.of(context).textTheme.display1,),
            SizedBox(height: 20.0,),
            Text(item["description"]),
            SizedBox(height: 20.0,),
            
            // SizedBox(height: 10.0,),
            // Text( "image: ${item['image']}"),
          ],
        ),
      ),
    ); 
  }
}