import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class AddItem1 extends StatefulWidget {
  final Function add ;
  AddItem1(this.add);

  @override
  _AddItem1State createState() => _AddItem1State();
}

class _AddItem1State extends State<AddItem1> {
    String title;
    String description;
    File _image;
  //File galleryimage;
    _showOptionsDialog () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 180,
            child: Column(
              children: <Widget>[
                Container(color: Colors.grey.shade200,
                  child: ListTile(title: Text("Pick image from any one of them"),),
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text("Pick from Gallery"),
                  onTap: (){
                     _getImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text("Take a picture"),
                  onTap: (){
                    _getImage(ImageSource.camera);
                    Navigator.pop(context);
                  } 
                ),
              ],
            ),
            
          ),backgroundColor: Colors.green[200]
        );
      }
    );
  }

 Future _getImage(ImageSource source) async {
    var image = await ImagePicker.pickImage(source:source);
    if(image != null) {
      setState(() {
        _image = image;
      });
    }
  }


    // cameraPicker() async {
    // print('Picker is called');
    // File img = await ImagePicker.pickImage(
    //   source: ImageSource.camera
    // );
    // if (img != null){
    // print(img.path);
    // setState(() {
    //  _image=img;  
    //       } );
    //     }
    //   } 
  //we pick from From Gallery 
    //   galleryPicker() async {
    //   galleryimage = await ImagePicker.pickImage(
    //     source: ImageSource.gallery,
      
    //   );
    //   print("You selected camera image : " + galleryimage.path);
    //   setState(() {
        
    //   });
    // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(
          child: Text("Add item"),
        )
      ),
      body:
       ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          TextField(
            onChanged: (value){
              setState(() {
               title =value ; 
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(

              ),
              hintText: "title",
              prefixIcon: Icon(Icons.title)
            ),
          ),
          SizedBox(height: 20,),
           TextField(
             onChanged: (value){
               setState(() {
                description=value ;  
               });
             },
             maxLines: 4,
            decoration: InputDecoration(
              border: OutlineInputBorder(

              ),
              hintText: "Description",
              // prefixIcon: Icon(
              //   Icons.description)
            ),
          ),
          SizedBox(height: 20,),

          SizedBox(height: 50,
          width: 20.0,
          child: 
          RaisedButton.icon(
            icon: Icon(Icons.camera),
            label: Text("Add Image"),
            color: Colors.blue,
            onPressed:()=>_showOptionsDialog(),
              )  
                ,),
          SizedBox(height: 20,),
         
          SizedBox(
            
          child: _image == null ? Container() : Image.file(_image,height: 200,),),
          SizedBox(height: 20,),
          // SizedBox(height: 50,
          // width: 20.0,
          // child: 
          // RaisedButton.icon(
          //       icon: Icon(Icons.photo_album),
          //       label: new Text('Add Image From Gallery'),
          //       color: Colors.blue,
          //       onPressed:galleryPicker,
          //   ),
          // ),
         // SizedBox(height: 20,),
          //displayFile(galleryimage),
        //  SizedBox(height: 20,),
          SizedBox(height: 50,
          width: 30.0,
          child: 
          RaisedButton.icon(
            icon: Icon(Icons.save),
            label: Text("Save Memo"),
            color: Colors.blue,
            onPressed: (){
              
               widget.add(title,description,_image);
               Navigator.pop(context);
            },
          ),
          )
        ],
      ),
    );
  }
}
  //  Widget displayFile(File file) {
  //   return new SizedBox(
  //     child: file == null
  //         ? null
  //         : new Image.file(file),
  //   );
  // }
