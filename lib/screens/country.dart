import 'package:flutter/material.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({ Key? key }) : super(key: key);

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  List<String> country=["India","Pakistan","America","England","Japan","Turkey","Afaganistan",];
  late List<String> selectCountry;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectCountry=country;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: TextField(
              onChanged: (value){
                    selectCountry=country.where((countries) => countries.contains(value)).toList();
                    setState(() {
                      
                    });
              },
              
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              height: 520,
              child: ListView.builder(
                itemCount: selectCountry.length,
                itemBuilder: (context, index){
                  return Container(
                    height: 45,
                    child: Card(child: Text(selectCountry[index])));
                }),
            ),
          )
        ],
      ),
    );
  }
}