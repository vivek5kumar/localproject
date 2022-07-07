import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  const PickImage({ Key? key }) : super(key: key);

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  final ImagePicker _picker=ImagePicker();
  File? image;

  getImage()async{
      XFile? pickedImage= await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        image=File(pickedImage!.path);
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImagePicker"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
        //  XFile ?pickedImage= await _picker.pickImage(source: ImageSource.camera);
        //   setState(() {
        //     image=File(pickedImage!.path);
        //   });
        getImage();
          }, 
          child: Text("Pick Image")),
          image==null?Text("There is no image"):Image.file(image!,width: 200,height: 200,)
        ],
      ),
    );
  }
}