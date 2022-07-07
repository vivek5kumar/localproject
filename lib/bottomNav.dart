import 'package:flutter/material.dart';
import 'package:mycollage/screens/dashboard.dart';
import 'package:mycollage/screens/holidays.dart';
import 'package:mycollage/screens/leavePage.dart';
import 'package:mycollage/screens/monthPage.dart';
import 'package:mycollage/screens/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({ Key? key }) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectIndex=0;
  final List<Widget> _children=[
    const Dashboard(),
    const MonthPage(),
    const LeavePage(),
    const Holidays(),
    const Profile()

  ];
  void _onTap(int index){
    setState(() {
      _selectIndex=index;

      switch(index){
        case 0:
        {
          // Provider.of<MonthProvider>(context,listen: true);
          break;
        }
        case 1:
        {
            break;
        }
        case 2:
        {
          break;
        }
         case 3:
        {
          break;
        }
         case 4:
        {
          break;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _children[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.blueAccent,
        onTap: _onTap,
        elevation: 2,
        currentIndex: _selectIndex,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            backgroundColor: Colors.blueAccent,
            label: "Dashboard",
            icon: Icon(Icons.dashboard)),
          const BottomNavigationBarItem(
            backgroundColor: Colors.blueAccent,
            label: "Month",
            icon: Icon(Icons.calendar_view_month)),
          const BottomNavigationBarItem(
            backgroundColor: Colors.blueAccent,
            label: "SuperCoin",
            icon: Icon(Icons.time_to_leave_sharp)),
            const BottomNavigationBarItem(
              backgroundColor: Colors.blueAccent,
            label: "Holidays",
            icon: Icon(Icons.flight)),
            const BottomNavigationBarItem(
              backgroundColor: Colors.blueAccent,
              label: "Profile",
              icon: Icon(Icons.account_box))
        ],),
    );
  }
}