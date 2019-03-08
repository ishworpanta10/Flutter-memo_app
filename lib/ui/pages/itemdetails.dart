import 'dart:io';
import 'package:flutter/material.dart';
import 'homepage.dart';

class ItemDetails extends StatelessWidget {
  final Map item;

  const ItemDetails({Key key, this.item}) : super(key: key);
  

  @override
    
  Widget build(BuildContext context) {
    _delete(Map item) {
          showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Delete item"),
                content: Text('Are you sure you want to delete ? '),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
                  item.remove(item);
                  Navigator.pop(context);
                    }
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ));
            }
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Center(
          child: Text(item["title"]),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: ()=>_delete(item),
    
            //  {
            //   Navigator.of(context).pushReplacement(MaterialPageRoute(
            //       builder: (BuildContext context) => HomePage()));
            // },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DecoratedBox(
              child: Container(
                height: 400,
                width: 400,
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: FileImage(
                File(item["img"]),
              ))),
            ),
            Text(
              item["title"],
              style: Theme.of(context).textTheme.display1,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(item["description"]),
            SizedBox(
              height: 20.0,
            ),

            // SizedBox(height: 10.0,),
            // Text( "image: ${item['image']}"),
          ],
        ),
      ),
    );
    

    
  }
}
