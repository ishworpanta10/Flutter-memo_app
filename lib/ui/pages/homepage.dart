import 'package:flutter/material.dart';
import 'additem.dart';
import 'itemdetails.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'demo.dart';

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
                    }),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
              title: Center(
                child: Text("Item list"),
              ),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    child: Text("Memo_App"),
                  ),
                  Tab(
                    child: Text("Books"),
                  ),
                  Tab(
                    child: Text("Copy"),
                  )
                ],
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DemoPage(),
                      ),
                    );
                  },
                )
              ],
              backgroundColor: Colors.blue,
            ),
            body: TabBarView(
              children: <Widget>[
                Card(
                  color: Colors.green[200],
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        //scrollPadding: EdgeInsets.all(10),
                        textAlign: TextAlign.start,
                        autofocus: false,
                        textInputAction: TextInputAction.search,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold, 
                          fontSize: 20.0,
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search), 
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25))),
                            hintText: "Seach",
                            labelText: "Search Me"),
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 20.0),
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            var item = items[index];
                            return Column(
                              children: <Widget>[
                                ListTile(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              ItemDetails(item: item))),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(item["description"]),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      //  Text(item["picture"])
                                    ],
                                  ),
                                ),
                                Divider(),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.green,
                  child: Center(
                    child: Text("Books"),
                  ),
                ),
                Card(
                  color: Colors.orange,
                  child: Center(
                    child: Text("Copy"),
                  ),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => AddItem1(addItem1))),
              tooltip: "Add Item",
              child: Icon(Icons.add),
            ),
            backgroundColor: Colors.green[200],
            
            bottomNavigationBar: BottomNavigationBar(
              fixedColor: Colors.green,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.star), title: Text("Following")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.games), title: Text("Games")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), title: Text("setting")),
              ],
              onTap: (int i) => print("hey $i"),
            ),
          ),
        ));
  }
}
