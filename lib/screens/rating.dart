import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mycollage/controllers/addController.dart';
import 'package:timer_builder/timer_builder.dart';

class Rating extends StatefulWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double? _ratingValue;
  final timeController=Get.put(AddController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kindacode.com'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Rate our prodcut?',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 25),
                // implement the rating bar
                Row(
                  children: [
                    RatingBar(
                        initialRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                            full: const Icon(Icons.star, color: Colors.orange),
                            half: const Icon(
                              Icons.star_half,
                              color: Colors.orange,
                            ),
                            empty: const Icon(
                              Icons.star_outline,
                              color: Colors.orange,
                            )),
                        onRatingUpdate: (value) {
                          setState(() {
                            _ratingValue = value;
                          });
                        }),
                         Text(
                  _ratingValue == null ?"Rate me" : _ratingValue.toString(),
                  style: const TextStyle(color: Colors.blue, fontSize: 20),
                )
                  ],
                ),
                
             TimerBuilder.periodic(const Duration(seconds: 1),builder: (context){
                      return Text(timeController.getTime(context));
                     })
               
              ],
            ),
          ),
        ));
  }
}