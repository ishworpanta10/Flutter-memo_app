import 'package:flutter/material.dart';
import 'additem.dart';
import 'itemdetails.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List items = [];

  void initState() {
    super.initState();
    getItems();
  }

  getItems() async {
    final sp = await SharedPreferences.getInstance();
    var itemString = sp.getString('items');
    if (itemString == null) {
      print("No Item found");
      setState(() {
        items = [];
      });
      await saveItems(items);
    } else {
      setState(() {
        items = json.decode(itemString);
      });
    }
  }

  saveItems(items) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString('items', json.encode(items));
    print("Saved Shared preference");
    print(items);
  }

  addItem1(String title, String description, File image) {
    setState(() {
      items.add({
        "title": title,
        "description": description,
        "img": image.path,
      });
      saveItems(items);
    });
  }

  removeItem1(Map item) {
    setState(() {
      items.remove({
        items.remove(item),
      });
      saveItems(items);

    });
  }

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
                    removeItem1(item);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Center(
          child: Text("Item list"),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {

            },
          )
        ],
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          
          TextField(
          //scrollPadding: EdgeInsets.all(10),
          textAlign: TextAlign.start , 
          autofocus: false , 
          textInputAction: TextInputAction.search,
          style: TextStyle(
            color: Colors.green , fontWeight: FontWeight.bold ,
            fontSize: 20.0,
           
          ),
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
          hintText: "Seach"    
          ) ,
          
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                var item = items[index];
                return ListTile(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ItemDetails(item: item))),
                  isThreeLine: true,
                  title: Text(item["title"]),
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      File(item["img"]),
                    ),
                    radius: 34,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete_forever),
                    onPressed: () => _delete(item),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(item["description"]),
                      SizedBox(
                        height: 40,
                      ),
                      //  Text(item["picture"])
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddItem1(addItem1))),
        tooltip: "Add Item",
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.green[200],
    );
  }
}
