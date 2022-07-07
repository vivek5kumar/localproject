import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycollage/screens/moviesDetails.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List movieName = [
    "KGF",
    "KGF Chapter 2",
    "Titanic",
    "The Avenger",
    "Blade Runner",
    "Mission Imposible",
    "Rambo",
    "Avatar",
    "The Race",
    "The Race",
    "The Race",
    "The Race",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie"),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.grey,
      body: ListView.builder(
          itemCount: movieName.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              child: ListTile(
                  leading: CircleAvatar(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(movieName[index]),
                    ),
                  ),
                  title: Text(movieName[index]),
                  // trailing:InkWell(
                  //   onTap: (){
                  //     // deleteMovie(index);
                  //     showDialog(context: context, builder: (context){
                  //       return AlertDialog(
                  //         title:Text ("Do you want to delete?"),
                  //         actions:<Widget> [
                  //             Row(
                  //              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 ElevatedButton(onPressed: (){
                  //                   deleteMovie(index);
                  //                   Get.back();
                  //                 }, child: Text("Ok")),
                  //                 ElevatedButton(onPressed: (){
                  //                   Get.back();
                  //                 }, child: Text("Cancle"))
                  //               ],
                  //             )
                  //         ],
                  //       );
                  //     });
                  //   },
                  //   child: Icon(Icons.delete,color: Colors.red,),
                  // ),
                  subtitle: const Text("Sub"),
                  onTap: () {
                    Get.to(
                        MoviesDetails(moviesName: movieName.elementAt(index)));
                  }),
            );
          }),
    );
  }

  void deleteMovie(val) {
    setState(() {
      movieName.removeAt(val);
    });
  }
}
