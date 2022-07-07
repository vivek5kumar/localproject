// ignore_for_file: avoid_returning_null_for_voi

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mycollage/controllers/dropdownController.dart';
import 'package:timer_builder/timer_builder.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  var isDisable = true;
  bool visibility = false;
  bool color = false;
  int? _selectedIndex;

  final dropDownController = Get.put(DropDownController());
  late TabController _tabController;
  DateTime currentTime = DateTime.now();

  String dropdownvalue = 'Item 1';

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  bool status = false;
  int counter = 0;
  int _start = 10;
  late Timer _timer;

  var difference;

// var date2 = DateTime.parse("2022-05-26 09:30:00");
//  var date1 = DateTime.now();
//   var difference = date2.difference(date1).inSeconds;

  void startTimer() {
     var date2 = DateTime.parse("2022-05-26 09:30:00");
    var date1 = DateTime.now();
     var difference = date2.difference(date1).inSeconds;
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          difference--;
        });
      },
    );
  }

  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _isFavorited = true;
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        counter++;
      } else {
        _isFavorited = true;
      }
    });
  }

  setVistibility() {
    visibility = !visibility;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void setButton() {
    if (isDisable) {
      isDisable = false;
    } else {
      isDisable = true;
    }
  }

  bool isEnable = true;
  enableButton() {
    setState(() {
      isEnable = true;
    });
  }

  disableButton() {
    setState(() {
      isEnable = false;
    });
  }
var date=DateTime.now();
// var formattedDate = DateFormat('yyyy-MM-dd').format(date).toString();
setdate(){}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(dropDownController.radioButton == 1
              ? "Apply Leave"
              : "Work From home"),
          // bottom: TabBar(
          //     controller: _tabController,
          //     indicatorSize: TabBarIndicatorSize.label,
          //     tabs: [
          //       const Tab(
          //         text: "UPCOMING",
          //       ),
          //       const Tab(
          //         text: "LIVE",
          //       ),
          //       const Tab(
          //         text: "COMPLETED",
          //       ),
          //     ]),
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("get notification"),
                Switch(
                    value: dropDownController.selectSwitch,
                    onChanged: (val) {
                      setState(() {
                        dropDownController.setSwitch(val);
                      });
                    })
              ],
            ),
            Text( DateFormat.yMMMEd().format(DateTime.now()), ),
            Row(
              children: [
                Radio(
                    activeColor: Colors.red,
                    value: 1,
                    groupValue: dropDownController.radioButton,
                    onChanged: (e) {
                      setState(() {
                        dropDownController.setRadio(e);
                      });
                    }),
                const Text("Leave"),
                Radio(
                    value: 2,
                    groupValue: dropDownController.radioButton,
                    onChanged: (e) {
                      setState(() {
                        dropDownController.setRadio(e);
                      });
                    }),
                const Text("Work From Home"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Expanded(flex: 3, child: Text("Leave Type:")),
                  Expanded(
                    flex: 7,
                    child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          errorMaxLines: 2,
                          border: OutlineInputBorder(),
                        ),
                        value: dropDownController.selectLeave,
                        items: dropDownController.radioButton == 1
                            ? dropDownController.leaveType.map((data) {
                                return DropdownMenuItem(
                                  value: data['value'],
                                  child: Text(data['id']),
                                );
                              }).toList()
                            : dropDownController.workType.map((data) {
                                return DropdownMenuItem(
                                  value: data['value'],
                                  child: Text(
                                    data['id'],
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                );
                              }).toList(),
                        onChanged: (value) {
                          dropDownController.radioButton == 1
                              ? dropDownController.setLeave(value)
                              : dropDownController.setWork(value);
                        }),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  const Expanded(flex: 3, child: Text("Approval :")),
                  Expanded(
                    flex: 7,
                    child: DropdownButtonFormField(
                        disabledHint: Text(dropDownController.selectApproval),
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        value: dropDownController.selectApproval,
                        items: dropDownController.name.map((data) {
                          return DropdownMenuItem(
                              value: data['value'], child: Text(data['id']));
                        }).toList(),
                        onChanged: (val) {
                          dropDownController.setApproval(val).obs;
                        }),
                  ),
                ],
              ),
            ),
            TimerBuilder.periodic(const Duration(seconds: 1),
                builder: (context) {
              return Card(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  dropDownController.getSystemTime(),
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ));
            }),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)
                            )),
                    child: const Text("Button1"),
                    onPressed: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                  ),
                  Visibility(
                      visible: visibility,
                      child: Column(
                        children: [
                          FloatingActionButton( 
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return const Padding(
                                      padding:   EdgeInsets.all(8.0),
                                      child: Text("Welcome to my Page"),
                                    );
                                  });
                            },
                            child: const Icon(Icons.chevron_right),
                          )
                        ],
                      )),
                ],
              ),
            ),

            // Opacity(
            //   opacity: 0.5,
            //   child: Column(
            //     children: const <Widget>[
            //       Text('Widget A'),
            //       Text('Widget B'),
            //     ],
            //   ),
            // ),
            // TabBarView(
            //   controller: _tabController,
            //   children: [

            //   ])
            IconButton(
              icon: (_isFavorited
                  ? const Icon(Icons.favorite_border)
                  : const Icon(Icons.favorite)),
              color: Colors.red[500],
              onPressed: _toggleFavorite,
            ),

            ElevatedButton(
                onPressed: () {
                  startTimer();
                },
                child: const Text("count")),
            Text("$counter"),
            // RaisedButton(
            //   onPressed: () {
            //     enableButton();
            //   },
            //   child: Text("Enable"),
            // ),
            // RaisedButton(
            //   onPressed: () {
            //     disableButton();
            //   },
            //   child: Text("Disable"),
            // )
          ],
        ));
  }
}
