import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycollage/controllers/addController.dart';
import 'package:timer_builder/timer_builder.dart';

class AddName extends StatefulWidget {
  const AddName({Key? key}) : super(key: key);

  @override
  State<AddName> createState() => _AddNameState();
}

class _AddNameState extends State<AddName> {
  final addController = Get.put(AddController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: SizedBox(
                  height: size.height*0.3,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                 
                    children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                          InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: const Icon(Icons.arrow_back)),
                           const Text("Add Details"),
                           
                         ],
                       ),
                      TextFormField(
                        controller: addController.nameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'add name',
                            fillColor: Colors.grey,
                            focusColor: Colors.grey),
                          validator: (val){
                            if(val!.isEmpty){
                              return "Required";
                            }
                          },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          width: size.width * 0.5,
                          child: Visibility(
                            visible: addController.isButtonActive,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                onPressed: () {
                                  addController .addItem(addController.nameController.text);
                                    if(addController.isButtonActive){
                                    addController.buttonfun();
                                    }
                                },
                                child:  Text("Add")),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      }),
      body: GetBuilder<AddController>(builder: (controller) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.item.length,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                title: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      border: Border.all(color: Colors.yellow, width: 2),
                      gradient: const LinearGradient(
                          colors: [Colors.red, Colors.blue])),
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(controller.item[index].toUpperCase(   )),
                     TimerBuilder.periodic(const Duration(seconds: 1),builder: (context){
                      return Text(addController.setDate());
                     })
                      ],
                    ),
                  ),
                ),
              );
            });
      }),
    );
  }
}
