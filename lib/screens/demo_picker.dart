import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DemoPicker extends StatefulWidget {
  const DemoPicker({ Key? key }) : super(key: key);

  @override
  State<DemoPicker> createState() => _DemoPickerState();
}

class _DemoPickerState extends State<DemoPicker> {
  final ImagePicker _picker= ImagePicker();
  File? image;
  // ignore: non_constant_identifier_names
  List<File>StoreImage=[];
bool isLoading=false;
  // get saveimage => null;

  //for single image select
  getImage()async{
      XFile? pickedImage= await _picker.pickImage(source: ImageSource.gallery);
      if(pickedImage!=null){
   setState(() {
        image=File(pickedImage.path);
        // SaveImage(pickedImage.path);
      });
  }
      }
  //      void SaveImage(path) async {
  //   // SharedPreferences saveimage = await SharedPreferences.getInstance();
  //   saveimage.setString("imagepath", path);
  // }
   
//for multiple image select
  getMultipleImage()async{
        List<XFile>?multiImage= await _picker.pickMultiImage(maxWidth: 200,maxHeight: 200);
        if(multiImage!=null){
          setState(() {
          StoreImage= multiImage.map((e)=>File(e.path)).toList();
        });
        }
        
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            getImage();
          },
           child: Text(("Picked"))),

           isLoading?const CircularProgressIndicator(color: Colors.blue,):
           image==null?const Text('select Image'):Container(
             child: Container(
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 border: Border.all()
               ),
               child: Image.file(image!,width: 200,height: 200,))),


             ElevatedButton(onPressed: (){
                getMultipleImage();
             }, child: const Text("Picked Multi")),

             Expanded(
               child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10),
                         itemCount: StoreImage.length,
                         itemBuilder: (BuildContext ctx, index) {
                return GridTile(child: Image.file(StoreImage[index]));
                         }),
             ),
        ],
      ),
    );
  }
}

