
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycollage/controllers/loginController.dart';

class MonthPage extends StatefulWidget {
  const MonthPage({ Key? key }) : super(key: key);

  @override
  State<MonthPage> createState() => _MonthPageState();
}

class _MonthPageState extends State<MonthPage> {
  final loginController = Get.find<LoginController>();
  List<String> name=["vivek","Shop","Packaging","Delievery"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  title:Text(monthController.userProfiledata.name), 
        ),
        body:SizedBox(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              shadowColor: Colors.redAccent,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Id :"),
                        Text("Name :"),
                        Text("Email :"),
                        Text("Date of Birth :"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(loginController.userProfiledata.id),
                        Text(loginController.userProfiledata.name),
                        Text(loginController.userProfiledata.email),
                        Text(loginController.userProfiledata.dob)
                      ],
                    )
                  ],
                ),
            ),
          ),
        ),

        
        // SizedBox(
        //   height: 100,
        //   width: 200,
        //   child: Card(
        //     child: Column(
        //       children: [
        //         Text("Hello1"),
        //         Text("Hello2"),
        //         Text("Hello3")
        //       ],
        //     ),
        //   ),
        // ) 
        
        // SizedBox(
        //   height: 75,
        //   child: ListView.builder(
        //         // physics: NeverScrollableScrollPhysics(),
        //         // physics: const ClampingScrollPhysics(),
                
        //         scrollDirection: Axis.horizontal,
        //         itemCount: name.length,
        //         itemBuilder: (context,index){  
        //           return Card(
        //             child: Container(
        //               width: 130,
        //               child: ListTile(
        //                 title: Center(
        //                   child: Column(
        //                     children: [
        //                       Text(name[index]),
        //                       ElevatedButton(
        //                         onPressed: (){
        //                         showDialog(context: context, builder: (context){
        //                             return AlertDialog(
        //                               // backgroundColor: Colors.redAccent.shade100,
        //                                 title: Row(
        //                                   children: [
        //                                     Icon(Icons.warning),
        //                                     Text("Do you want to delete list!"),
        //                                   ],
        //                                 ),
        //                                 actions: [
        //                                   Padding(padding: EdgeInsets.all(10),
        //                                   child: Row(
        //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                                     children: [
        //                                       ElevatedButton(onPressed: (){
        //                                         // itemsDelete(index);
        //                                         Get.back();
        //                                       }, child: Text("Ok")),
        //                                       ElevatedButton(onPressed: (){
        //                                         Get.back();
        //                                       }, child: Text("Cancle"))
        //                                     ],
        //                                   ),
        //                                   )
        //                                 ],
        //                             );
                              
        //                         });
        //                         },
        //                        child: Text("Remove items")),

        //                     ],
        //                   ))),
        //             ),
        //           );
        //      }),
            
        // ),
    );
  }}
