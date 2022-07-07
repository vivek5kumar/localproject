import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycollage/controllers/timer_dateController.dart';

class TimeDemo extends StatefulWidget {
  const TimeDemo({ Key? key }) : super(key: key);

  @override
  State<TimeDemo> createState() => _TimeDemoState();
}

class _TimeDemoState extends State<TimeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<TimeController>(
        init: Get.put(TimeController()),
        builder: (controller){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Flexible(
                    flex: 4,
                    child: Text("Date")),
          
                    Flexible(
                      flex: 6,
                      child: TextFormField(
                        
                         readOnly: true,
                        onTap: ()=>controller.stetDate(context),
                        controller: controller.textController[1],
                        decoration: const InputDecoration(
                          hintText: "Select Date",
                          border: const OutlineInputBorder()
                        ),
                      ),
                    )    
                ],
              ),
            ),
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Flexible(
                            flex: 4,
                            child: const Text("Start Time")),
                            Flexible(
                        flex: 6,
                        child: TextFormField(
                          onTap: (){},
                          decoration: const InputDecoration(border: const OutlineInputBorder()),
                        ))
                        ],
                      ),
                 ),
          ],
        );
      }),
    );
  }
}