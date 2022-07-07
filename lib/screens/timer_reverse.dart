import 'dart:async';

import 'package:flutter/material.dart';

class TimeCount extends StatefulWidget {
  const TimeCount({ Key? key }) : super(key: key);

  @override
  State<TimeCount> createState() => _TimeCountState();
}

class _TimeCountState extends State<TimeCount> {

   Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);
 
  /// Timer related methods ///
  // Step 3
  void startTimer() {
      final date2 = DateTime.parse("2022-05-31");
      final date1 = DateTime.now();
      final difference = date2.difference(date1).inSeconds;
 
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) {
            final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });

        });
  }
  // Step 4
  // void stopTimer() {
  //   setState(() => countdownTimer!.cancel());
  // }
  // // Step 5
  // void resetTimer() {
  //   stopTimer();
  //   setState(() => myDuration = Duration(days: 5));
  // }
  // // Step 6
  // void setCountDown() {
  //   final reduceSecondsBy = 1;
  //   setState(() {
  //     final seconds = myDuration.inSeconds - reduceSecondsBy;
  //     if (seconds < 0) {
  //       countdownTimer!.cancel();
  //     } else {
  //       myDuration = Duration(seconds: seconds);
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
     String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    // Step 7
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    // final milliSeconds = strDigits(myDuration.inMilliseconds.remainder(60));
    return Scaffold(
      appBar: AppBar(
        title: Text("Time"),
      ),
      body: Center(
        child: Column(
          children: [
               const SizedBox(
                height: 50,
              ),
              // Step 8
              Text(
                '$hours:$minutes:$seconds',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 50),
              ),

                SizedBox(height: 20),
              // Step 9
              ElevatedButton(
                onPressed: startTimer,
                child: const Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
                //  ElevatedButton(
                // onPressed: () {
                //   if (countdownTimer == null || countdownTimer!.isActive) {
                //     stopTimer();
                //   }
                // },
              //   child: const Text(
              //     'Stop',
              //     style: TextStyle(
              //       fontSize: 30,
              //     ),
              //   ),
              // ),
                // ElevatedButton(
                //   onPressed: () {
                //     resetTimer();
                //   },
                //   child: const Text(
                //     'Reset',
                //     style: TextStyle(
                //       fontSize: 30,
                //     ),
                //   ))
          ],
        ),
      ),
    );
  }
}