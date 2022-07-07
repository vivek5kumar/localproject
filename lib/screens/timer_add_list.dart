import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carausal extends StatefulWidget {
  const Carausal({Key? key}) : super(key: key);

  @override
  State<Carausal> createState() => _CarausalState();
}

class _CarausalState extends State<Carausal> {
  List<String> country = [
    "India",
    "Pakistan",
    "America",
    "England",
    "Japan",
    "Turkey",
    "Afaganistan",
  ];

List<String> name=[];
final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carausal"),
      ),
      body: GridView.builder(
        itemCount: country.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (3 / 2),
                ), 
                  itemBuilder: (BuildContext contest,int index){
          return  Card(
            child: Text(country[index]),
          );
        })
      // Card(
      //   child: Column(
      //     children: [
      //       Row(
      //         children: <Widget>[
               
      //           Expanded(
      //             child: Theme(
      //               data: Theme.of(context)
      //                   .copyWith(dividerColor: Colors.transparent),
      //               child: const ExpansionTile(
      //                 title: Text('Title'),
      //                 subtitle: Text('Subtitle'),
      //                 children: <Widget>[
      //                   Padding(
      //                     padding: EdgeInsets.only(left: 25),
      //                     child: ListTile(
      //                       title: Text('child title'),
      //                       subtitle: Text('child subtitle'),
      //                       trailing: Icon(Icons.chevron_right),
      //                     ),
      //                   ),
      //                   Padding(
      //                     padding: EdgeInsets.only(left: 25),
      //                     child: ListTile(
      //                       title: Text('child title'),
      //                       subtitle: Text('child subtitle'),
      //                       trailing: Icon(Icons.chevron_right),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //       const SizedBox(
      //         height: 200,
      //         width: 200,
      //         child: Card(
               
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      //  PageView.builder(
      //     itemCount: country.length,
      //     pageSnapping: true,
      //     itemBuilder: (context, index) {
      //       return Container(
      //         height: 50,
      //         child: Card(
      //           child: Center(child: Text(country[index]))),
      //       );
      //     }),
    );
  }
  addAllName(val){
    name.add(val);
  }
}
